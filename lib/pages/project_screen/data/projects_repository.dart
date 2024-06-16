import 'package:flutter/material.dart';
import 'package:kanban_board/core/error/exception.dart';
import 'package:kanban_board/pages/project_screen/data/projects_remote_data_source.dart';
import 'package:kanban_board/pages/project_screen/modal/get_all_projects.dart';



abstract class ProjectRepository {

  Future<GetAllProjectsDto> getAllProjects( BuildContext context);
  Future<int?> createProject( String name);
  Future<int?> updateProject( int id, String name);
  Future<int?> deleteProject( int id);
}

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRemoteDataSource _projectRemoteDataSource;

  ProjectRepositoryImpl(this._projectRemoteDataSource);

  @override
  Future<GetAllProjectsDto> getAllProjects(BuildContext context) async {
    try {
      final apiResponse = await _projectRemoteDataSource.getAllProjects(
          context);
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
  Future<int?> createProject(String name) async {
    try {
      final apiResponse = await _projectRemoteDataSource.createProject(
           name);
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
  Future<int?> updateProject( int id, String name) async {
    try {
      final apiResponse = await _projectRemoteDataSource.updateProject(  id,  name);
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
  Future<int?>deleteProject( int id) async {
    try {
      final apiResponse = await _projectRemoteDataSource.deleteProject( id);
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
