
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/core/data/model/ui_status.dart';
import 'package:kanban_board/core/error/exception.dart';
import 'package:kanban_board/pages/project_screen/cubit/projects_state.dart';
import 'package:kanban_board/pages/project_screen/data/projects_repository.dart';
import 'package:kanban_board/pages/project_screen/modal/get_all_projects.dart';
import 'package:rxdart/rxdart.dart';


class ProjectCubitNew extends Cubit<ProjectState>  {

  final ProjectRepository _profileRepository;
  ProjectCubitNew(this._profileRepository):super(ProjectInitialState());

  final _uiStatus = BehaviorSubject<UIStatus>.seeded(UIStatus());

  Stream<UIStatus> get uiStatus => _uiStatus.stream;

  Function(UIStatus) get changeUIStatus => _uiStatus.sink.add;


  final _allProjectsData = BehaviorSubject<List<ProjectDto>>();
  Stream<List<ProjectDto>> get allProjectsData => _allProjectsData.stream;
  List<ProjectDto> get allProjectsDataValue => _allProjectsData.value;
  Function(List<ProjectDto>) get changeAllProjectsData => _allProjectsData.sink.add;
  @override
  Future<void> close() {

    _uiStatus.close();
    _allProjectsData.close();

    return super.close();
  }


  Future getAllProjects(BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      GetAllProjectsDto apiResponse = await _profileRepository.getAllProjects(
           context
      );
       if (apiResponse.projects.isNotEmpty) {
         changeAllProjectsData(apiResponse.projects);
          changeUIStatus(UIStatus(
              isDialogLoading: false,
            ));
         for (var project in apiResponse.projects) {
           print('Project ID: ${project.id}, Project Name: ${project.name}');
         }
          print("gdfhghdfj ${apiResponse}");
         }else{
         changeUIStatus(UIStatus(isDialogLoading: false));
         }
       }
    catch (e) {
      if (e is ServerException) {
        changeUIStatus(UIStatus(
            isDialogLoading: false, failureWithoutAlertMessage: e.message));
      } else {
        changeUIStatus(UIStatus(
            isDialogLoading: false,
            failureWithoutAlertMessage:
            'We regret the technical error. Please try again after some time.'));
      }
    }
  }

  Future createProject(String name, BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _profileRepository.createProject(
          name
      );
      if (apiResponse.toString()== "200") {
      //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        getAllProjects(context);
      }else{
        changeUIStatus(UIStatus(isDialogLoading: false));
      }
    }
    catch (e) {
      if (e is ServerException) {
        changeUIStatus(UIStatus(
            isDialogLoading: false, failureWithoutAlertMessage: e.message));
      } else {
        changeUIStatus(UIStatus(
            isDialogLoading: false,
            failureWithoutAlertMessage:
            'We regret the technical error. Please try again after some time.'));
      }
    }
  }

  Future updateProject(int id, String name, BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _profileRepository.updateProject(
         id, name
      );
      if (apiResponse.toString()== "200") {
        //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        getAllProjects(context);

      }else{
        changeUIStatus(UIStatus(isDialogLoading: false));
      }
    }
    catch (e) {
      if (e is ServerException) {
        changeUIStatus(UIStatus(
            isDialogLoading: false, failureWithoutAlertMessage: e.message));
      } else {
        changeUIStatus(UIStatus(
            isDialogLoading: false,
            failureWithoutAlertMessage:
            'We regret the technical error. Please try again after some time.'));
      }
    }
  }

  Future deleteProject(int id, BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _profileRepository.deleteProject(
          id
      );
      if (apiResponse.toString()== "204") {
        //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        getAllProjects(context);

      }else{
        changeUIStatus(UIStatus(isDialogLoading: false));
      }
    }
    catch (e) {
      if (e is ServerException) {
        changeUIStatus(UIStatus(
            isDialogLoading: false, failureWithoutAlertMessage: e.message));
      } else {
        changeUIStatus(UIStatus(
            isDialogLoading: false,
            failureWithoutAlertMessage:
            'We regret the technical error. Please try again after some time.'));
      }
    }
  }

}