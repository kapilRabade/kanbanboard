import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/data/local/shared_preference_keys.dart';
import 'package:kanban_board/core/data/local/shared_preference_utils.dart';
import 'package:kanban_board/core/ui/buttons/raised_rect_button.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:kanban_board/di/injection_container.dart';
import 'package:kanban_board/pages/project_screen/modal/get_all_projects.dart';
import 'package:kanban_board/route/router.dart';

import '../../../core/utils/helper.dart';
import '../cubit/projects_cubit.dart';

class KanbanBoardProjectScreenView extends StatefulWidget {
  @override
  State<KanbanBoardProjectScreenView> createState() =>
      _KanbanBoardProjectScreenViewState();
}

class _KanbanBoardProjectScreenViewState
    extends State<KanbanBoardProjectScreenView> {
 // final ProjectCubit projectCubit = ProjectCubit(ProjectService());

  final _projectCubitNew = sl<ProjectCubitNew>();
  List<String> language = ["English", "Germany"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribeUIStatus();
    fetchLanguageCode();
    _projectCubitNew.getAllProjects(context);
  }

  void fetchLanguageCode() async {
    SPUtil? spUtil = await SPUtil.getInstance();
    String languageCode = spUtil!.getString(SPKeys.LANGUAGE_CODE_KEY) ?? 'en';
    Get.locale = Locale(languageCode, '');
    print(Get.locale);
  }

  void subscribeUIStatus() {
    _projectCubitNew.uiStatus.listen((uiStatus) {
      if (uiStatus.isDialogLoading != null && uiStatus.isDialogLoading!) {
        if (mounted) {
          Helper.showLoadingDialog(context, 'loading'.tr);
        }
      } else if (uiStatus.isDialogLoading != null &&
          !uiStatus.isDialogLoading!) {
        if (mounted) {
          Helper.hideLoadingDialog(context);
        }
      }
      if (uiStatus.successWithAlertMessage.isNotEmpty) {
        Helper.showSnackBar(uiStatus.successWithAlertMessage);
      }
      if (uiStatus.successWithoutAlertMessage.isNotEmpty) {
        Helper.showSnackBar(uiStatus.successWithoutAlertMessage);
      }
      if (uiStatus.failureWithAlertMessage.isNotEmpty) {
        Helper.showAlertDialog(context, uiStatus.failureWithAlertMessage);
      }
      if (uiStatus.failureWithoutAlertMessage.isNotEmpty) {
        Helper.showSnackBar(uiStatus.failureWithoutAlertMessage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(
          "projects".tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "English") {
                Get.updateLocale(const Locale('en'));
                setLocale('en');
              } else {
                Get.updateLocale(const Locale('de'));
                setLocale('de');
              }
            },
            itemBuilder: (context) => language
                .map((e) => PopupMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16),
                    )))
                .toList(),
            child: const Icon(Icons.language),
          ).paddingOnly(right: 20),
        ],
      ),
      body: Stack(
        children: [
          showProjectsList(),
          Positioned.fill(
              bottom: 10,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: showCreateProjectButton())),
        ],
      ),
    );
  }

  void setLocale(String languageCode) async {
    SPUtil? spUtil = await SPUtil.getInstance();
    spUtil!.putString(SPKeys.LANGUAGE_CODE_KEY, languageCode!);
    print("Locale set to $languageCode");
  }

  Widget showProjectsList() {
    return StreamBuilder<List<ProjectDto>>(
      stream: _projectCubitNew.allProjectsData,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  //  final project = projects[index];
                  return Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(MRouter.TaskViewWidgetRoute, arguments: [
                          snapshot.data![index].id!,
                          snapshot.data![index].name!
                        ]);
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2,
                              offset: Offset(5, 5),
                            ),
                          ],
                          color: AppColors.white,
                          borderRadius:
                              BorderRadius.circular(10.0), // Uniform radius
                        ),
                        child: ListTile(
                          title: Text(snapshot.data![index].name!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showUpdateProjectDialog(
                                    context,
                                    int.parse(snapshot.data![index].id!),
                                    snapshot.data![index].name!),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _projectCubitNew.deleteProject(
                                    int.parse(snapshot.data![index].id!),
                                    context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text("no_projects_found_create_new".tr),
              );
      },
    );
  }

  Widget showCreateProjectButton() {
    return RaisedRectButton(
      text: "create_project".tr,
      textColor: AppColors.white,
      onPressed: () {
        _showCreateProjectDialog(context);
      },
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }

  void _showCreateProjectDialog(BuildContext context) {
    String projectName = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('create_project'.tr),
          content: TextField(
            onChanged: (value) {
              projectName = value;
            },
            decoration: InputDecoration(hintText: "project_name".tr),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _projectCubitNew.createProject(projectName, context);
                Navigator.of(context).pop();
              },
              child: Text(
                'create'.tr,
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateProjectDialog(
      BuildContext context, int projectId, String currentName) {
    String updatedName = currentName;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('update_project'.tr),
          content: TextField(
            onChanged: (value) {
              updatedName = value;
            },
            decoration: InputDecoration(hintText: "project_name".tr),
            controller: TextEditingController(text: currentName),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _projectCubitNew.updateProject(projectId, updatedName, context);
                Navigator.of(context).pop();
              },
              child: Text('update'.tr),
            ),
          ],
        );
      },
    );
  }
}
