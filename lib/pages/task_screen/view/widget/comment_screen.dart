
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/core/ui/textfield/custom_text_field.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:kanban_board/pages/task_screen/cubit/task_cubit.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_comments.dart';

class CommentBottomSheetView extends StatefulWidget {
  String taskId;
  TaskCubit taskCubit;

  CommentBottomSheetView(
      this.taskId, this.taskCubit,
      {super.key});

  @override
  State<CommentBottomSheetView> createState() =>
      _RepliesBottomSheetState();
}

class _RepliesBottomSheetState
    extends State<CommentBottomSheetView> {
  TextEditingController addCommentController = TextEditingController();


  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future fetchComments() async {

    widget.taskCubit.getAllComment(
      context,widget.taskId);

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GetAllComments>>(
      stream: widget.taskCubit.allCommentData,
      builder: (context, snapshot) {
        return
             DraggableScrollableSheet(
          initialChildSize: .85,
          minChildSize: .5,
          maxChildSize: .85,
          expand: false,
          builder:
              (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.5),
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () async {
                     Get.back();
                     widget.taskCubit.changeAllCommentData([]);
                      },
                    ),
                  ),
                  snapshot.hasData? Expanded(
                    child: Column(
                      children: [



                        snapshot.hasData
                            ? snapshot.data!.isNotEmpty
                            ? Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            itemBuilder: (context, index) {
                              return Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot.data![index].content.toString()),
                              ));

                              /*  createCommentTile(
                                                      context,
                                                      snapshot.data![index],
                                                      index)
                                                  .paddingOnly(
                                                      left: 10, right: 10);*/
                            },
                          ),
                        )
                            : const Expanded(
                          child: Center(
                            child: Text(
                             "No Comments Available"
                            ),
                          ),
                        )
                            : const Expanded(
                          child: Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):const SizedBox(),
                 snapshot.hasData? const SizedBox(): const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: CustomTextField(
                      // onChange: widget.newsCubit.changePostCommentTextField,
                      style: const TextStyle(
                           fontSize: 13, color: AppColors.black
                      ),
                      hintText: "Add Comment",
                      contentPadding: const EdgeInsets.fromLTRB(4, 24, 12, 0),
                      controller: addCommentController,
                      hintStyle: const TextStyle(
                         fontSize: 13, color :AppColors.black
                      ),
                      suffixIcon: IconButton(
                        splashColor: AppColors.black,
                        onPressed: () async {
                          await widget.taskCubit.createComment(
                              addCommentController.text,widget.taskId,context);
                          fetchComments();

                          addCommentController.text = '';
                        },
                        icon: const RotationTransition(
                          alignment: Alignment.centerRight,
                          turns: AlwaysStoppedAnimation(270 / 360),
                          child: Icon(Icons.double_arrow),
                        ),
                        color: AppColors.lightpurple,
                        iconSize: 18,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }




  }






