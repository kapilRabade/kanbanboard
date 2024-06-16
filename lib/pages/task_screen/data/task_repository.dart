import 'package:flutter/material.dart';
import 'package:kanban_board/core/error/exception.dart';
import 'package:kanban_board/pages/task_screen/data/task_remote_data_source.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_comments.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_completed_task.dart';



abstract class TaskRepository {

  Future<List<Map<String, dynamic>>> getAllTask( BuildContext context,String projectId);
  Future<int?> createTask( String content, String projectId );
  Future<int?> updateTask( String taskId, String content );
  Future<int?> deleteTask( String taskId);
  Future<GetAllCommentsDto> getAllComment( BuildContext context,String projectId);
  Future<int?> createComment( String content, String projectId );
  Future<int?> updateTaskToInprogress( String content, String taskId);
  Future<int?> closeTask(  String taskId);
  Future<List<Map<String, dynamic>>> getAllCompletedTask(BuildContext context,  String projectId);
}

class TaskRepositoryImpl implements TaskRepository {
  TaskRemoteDataSource _taskRemoteDataSource;

  TaskRepositoryImpl(this._taskRemoteDataSource);

  @override
  Future<int?> updateTaskToInprogress(String content, String taskId ) async {
    try {
      final apiResponse = await _taskRemoteDataSource.updateTaskToInprogress(
          content,  taskId );
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<int?> closeTask( String taskId ) async {
    try {
      final apiResponse = await _taskRemoteDataSource.closeTask(
          taskId );
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllCompletedTask(BuildContext context,  String projectId ) async {

      final apiResponse = await _taskRemoteDataSource.getAllCompletedTask(
          context,  projectId );
      return apiResponse;

  }


  @override
  Future<List<Map<String, dynamic>>> getAllTask(BuildContext context,String projectId) async {
    try {
      final apiResponse = await _taskRemoteDataSource.getAllTask(
          context, projectId);
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<int?> createTask(String content, String projectId ) async {
    try {
      final apiResponse = await _taskRemoteDataSource.createTask(
           content,  projectId );
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<int?> updateTask( String taskId, String content ) async {
    try {
      final apiResponse = await _taskRemoteDataSource.updateTask(   taskId,  content );
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<int?>deleteTask( String taskId) async {
    try {
      final apiResponse = await _taskRemoteDataSource.deleteTask(  taskId);
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<GetAllCommentsDto> getAllComment(BuildContext context,String taskId) async {
    try {
      final apiResponse = await _taskRemoteDataSource.getAllComment(
          context, taskId);
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<int?> createComment(String content, String taskId ) async {
    try {
      final apiResponse = await _taskRemoteDataSource.createComment(
          content,  taskId );
      return apiResponse;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
