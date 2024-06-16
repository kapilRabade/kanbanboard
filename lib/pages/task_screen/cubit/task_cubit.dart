
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/core/data/model/ui_status.dart';
import 'package:kanban_board/core/error/exception.dart';
import 'package:kanban_board/pages/task_screen/cubit/task_state.dart';
import 'package:kanban_board/pages/task_screen/data/task_repository.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_comments.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_completed_task.dart';
import 'package:rxdart/rxdart.dart';


class TaskCubit extends Cubit<TaskState>  {

  final TaskRepository _taskRepository;
  TaskCubit(this._taskRepository):super(TaskInitialState());

  final _uiStatus = BehaviorSubject<UIStatus>.seeded(UIStatus());

  Stream<UIStatus> get uiStatus => _uiStatus.stream;

  Function(UIStatus) get changeUIStatus => _uiStatus.sink.add;


  final _allCommentData = BehaviorSubject<List<GetAllComments>>();
  Stream<List<GetAllComments>> get allCommentData => _allCommentData.stream;
  List<GetAllComments> get allCommentDataValue => _allCommentData.value;
  Function(List<GetAllComments>) get changeAllCommentData => _allCommentData.sink.add;
  @override
  Future<void> close() {
   _allCommentData.close();
    _uiStatus.close();


    return super.close();
  }


  Future<List<Map<String, dynamic>>?> getAllTask(BuildContext context,String projectId) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      List<Map<String, dynamic>> apiResponse = await _taskRepository.getAllTask(
           context, projectId
      );
       if (apiResponse.isNotEmpty) {
       //  changeAllTaskData(apiResponse.projects);
          changeUIStatus(UIStatus(
              isDialogLoading: false,
            ));

          return apiResponse;
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

  Future createTask(String content, String projectId ,BuildContext context ) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.createTask(
           content,  projectId
      );
      if (apiResponse.toString()== "200" ||apiResponse == 200) {
      //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
       // getAllTask(context,projectId);
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

  Future updateTask(String taskId, String content , BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.updateTask(
           taskId,  content
      );
      if (apiResponse.toString()== "200") {
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
       // getAllTask(context,"");

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

  Future deleteTask(String taskId, BuildContext context) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.deleteTask(
           taskId
      );
      if (apiResponse.toString()== "204" || apiResponse.toString()== 204) {
        //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
      //  getAllTask(context,"");

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

  Future<List<Map<String, dynamic>>?> getAllComment(BuildContext context,String taskId) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      GetAllCommentsDto apiResponse = await _taskRepository.getAllComment(
          context, taskId
      );
      if (apiResponse.comments.isNotEmpty) {
        changeAllCommentData(apiResponse.comments);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));

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

  Future createComment(String content, String projectId ,BuildContext context ) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.createComment(
          content,  projectId
      );
      if (apiResponse.toString()== "200" ||apiResponse == 200) {
        //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        // getAllTask(context,projectId);
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



  Future updateTaskToOnProgress(  String taskId) async {
    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.updateTaskToInprogress(
          "content",  taskId
      );

      if (apiResponse.toString()== "200" ||apiResponse == 200) {
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        // getAllTask(context,projectId);
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
  Future closeTask( String taskId ,BuildContext context ) async {

    try {
      changeUIStatus(UIStatus(isDialogLoading: true));
      final apiResponse = await _taskRepository.closeTask(
           taskId
      );
      if (apiResponse.toString()== "200" ||apiResponse == 200) {
        //  changeAllProjectsData(apiResponse.projects);
        changeUIStatus(UIStatus(
          isDialogLoading: false,
        ));
        // getAllTask(context,projectId);
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
  Future<List<Map<String, dynamic>>> getAllCompletedTask(BuildContext context,  String projectId ) async {


      changeUIStatus(UIStatus(isDialogLoading: true));
      List<Map<String, dynamic>> apiResponse = await _taskRepository.getAllCompletedTask(
          context,  projectId
      );

        return apiResponse;

  }

}