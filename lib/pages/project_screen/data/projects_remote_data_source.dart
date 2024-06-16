import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/core/data/remote/remote_data_source.dart';
import 'package:kanban_board/core/data/remote/rest_client.dart';
import 'package:kanban_board/core/error/exception.dart';
import 'package:kanban_board/pages/project_screen/modal/get_all_projects.dart';


abstract class ProjectRemoteDataSource{

  Future<GetAllProjectsDto> getAllProjects( BuildContext context);
  Future<int?> createProject( String name);
  Future<int?> updateProject( int id, String name);
  Future<int?> deleteProject( int id);
}
class ProjectRemoteDataSourceImpl extends RemoteDataSource implements ProjectRemoteDataSource{


  @override
  Future<GetAllProjectsDto> getAllProjects( BuildContext context) async {
    try {
      Response? response = await restClient.get(
          context, projects);
      return  GetAllProjectsDto.fromJson(response.data);
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<int?> createProject(String name ) async {
    try {
      Response? response = await restClient.post(
           projects,
        body: {'name': name},
      );
      return  response!.statusCode;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<int?> updateProject(int id, String name ) async {
    print(name);
    try {
      Response? response = await restClient.post(
          "$projects/$id",
        body: {'name': name},
      );
      return  response!.statusCode;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<int?> deleteProject( int id) async {
    try {
      Response? response = await restClient.delete(
           "$projects/$id");
      return response!.statusCode;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }





}