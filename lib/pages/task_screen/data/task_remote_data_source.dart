import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/core/data/remote/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:kanban_board/core/data/remote/rest_client.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_comments.dart';
import 'package:kanban_board/pages/task_screen/modal/get_all_completed_task.dart';

abstract class TaskRemoteDataSource{

  Future<List<Map<String, dynamic>>> getAllTask( BuildContext context,String projectId);
  Future<int?> createTask( String content, String projectId);
  Future<int?> updateTask( String taskId, String content );
  Future<int?> deleteTask( String taskId);
  Future<GetAllCommentsDto> getAllComment( BuildContext context,String taskId);
  Future<int?> createComment( String content, String taskId);
  Future<int?> updateTaskToInprogress( String content, String taskId);
  Future<int?> closeTask(  String taskId);
  Future<List<Map<String, dynamic>>> getAllCompletedTask(BuildContext context,  String taskId);
}
class TaskRemoteDataSourceImpl extends RemoteDataSource implements TaskRemoteDataSource{
  static const String apiUrl = 'https://api.todoist.com/rest/v2';
  static const String apiToken = '5af2dc2fe6f85baff82bd02b407139f9aae9fe40';

  @override
  Future<int?> updateTaskToInprogress(String content, String taskId ) async {
    final response = await http.post(
      Uri.parse('$apiUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'due_string': "tomorrow",
      }),
    );
    return response.statusCode;

  }

  @override
  Future<int?> closeTask( String taskId ) async {
    final response = await http.post(
      Uri.parse('$apiUrl/tasks/$taskId/close'),
      headers: {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      },
      // body: json.encode({
      //   'content': content,
      // }),
    );
    return response.statusCode;

  }

  @override
  Future<List<Map<String, dynamic>>> getAllCompletedTask( BuildContext context, String projectId) async {

    Response? response = await restClient.get(
        context, "https://api.todoist.com/sync/v9/completed/get_all?project_id=${projectId}");
    List<dynamic> data = response.data["items"];

    return data.map((task) => task as Map<String, dynamic>).toList();
   // return GetAllCompletedTaskDto.fromJson(response.data);;


  }
  Future<List<Map<String, dynamic>>> getTasks() async {
    final response = await http.get(
      //   Uri.parse('https://api.todoist.com/sync/v9/completed/get_all?project_id=2334496417'),

      Uri.parse('$apiUrl/tasks?project_id=${"2334496417"}'),
      headers: {'Authorization': 'Bearer $apiToken'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((task) => task as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }



  @override
  Future<List<Map<String, dynamic>>> getAllTask( BuildContext context, String projectId) async {


      final response = await http.get(

        Uri.parse('$apiUrl/tasks?project_id=${projectId}'),
        headers: {'Authorization': 'Bearer $apiToken'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((task) => task as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load tasks');
      }

  }


  @override
  Future<int?> createTask(String content, String projectId ) async {

    final response = await http.post(
      Uri.parse('$apiUrl/tasks'),
      headers: {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'content': content,
        'project_id': projectId,
      }),
    );
    return  response!.statusCode;

  }

  @override
  Future<int?> updateTask(String taskId, String content ) async {
    final response = await http.post(
      Uri.parse('$apiUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'content': content,
      }),
    );
    return response.statusCode;

  }

  @override
  Future<int?> deleteTask( String taskId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );
    return response.statusCode;
    // try {
    //   Response? response = await restClient.delete(
    //        "/tasks/$taskId");
    //   return response!.statusCode;
    // } catch (e) {
    //   if (e is ServerException) {
    //     throw ServerException(e.code, e.message);
    //   } else {
    //     throw Exception(e.toString());
    //   }
    // }
  }




  @override
  Future<GetAllCommentsDto> getAllComment( BuildContext context, String taskId) async {

    Response? response = await restClient.get(
        context, "${comment}?task_id=${taskId}");

    return  GetAllCommentsDto.fromJson(response.data);

    // final response = await http.get(
    //   //   Uri.parse('https://api.todoist.com/sync/v9/completed/get_all?project_id=2334496417'),
    //
    //   Uri.parse('$apiUrl/comments?task_id=${taskId}'),
    //   headers: {'Authorization': 'Bearer $apiToken'},
    // );
    //
    // if (response.statusCode == 200) {
    //   List<dynamic> data = json.decode(response.body);
    //   return  GetAllCommentsDto.fromJson(response.body as List);
    // } else {
    //   throw Exception('Failed to load tasks');
    // }

  }


  @override
  Future<int?> createComment(String content, String taskId ) async {

    final response = await http.post(
      Uri.parse('$apiUrl/comments'),
      headers: {
        'Authorization': 'Bearer $apiToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'content': content,
        'task_id': taskId,
      }),
    );
    return  response!.statusCode;


  }



}