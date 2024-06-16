import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/core/data/remote/remote_data_source.dart';
import 'package:kanban_board/core/error/exception.dart';


class RestClient {
  Dio? _dio;



  RestClient() {
    BaseOptions options = BaseOptions(
      baseUrl: RemoteDataSource.BASE_URL,
      connectTimeout: const Duration(seconds: 180),
      receiveTimeout: const Duration(seconds: 180),
    );
    _dio = Dio(options);
    _dio!.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }





  Future<Response> get(BuildContext context, apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    option = Options(method: "get");

    Map<String, dynamic> headers = HashMap();


    String authorizationToken =

    "Bearer 5af2dc2fe6f85baff82bd02b407139f9aae9fe40";

    if (authorizationToken != null) {

      headers.putIfAbsent('authorization', () => authorizationToken);
    }

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      Response response =
      await _dio!.request(apiName, data: body, options: option);
     print("sdfggdsfhgdhs ${response.statusCode}");
     print("sdfggdsfhgdhs ${response.data}");
      if (response.statusCode! < 200 || response.statusCode! > 400) {

        throw ServerException(response.statusCode!, response.statusMessage!);
      }

      if (response != null) {
        return response;
      } else {
        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    } catch (e) {
      if (e is DioError) {
        var error = e as DioError;

        if (error.response != null &&
            error.response!.statusCode != null &&
            error.response!.statusCode == 400 &&
            error.response!.data != null) {
          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        }

        if (error.response != null && error.response!.statusCode == 401) {
          if (context != null) doLogout(context);

        }

        if (error != null &&
            error.response != null &&
            error.response!.data != null) {

          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        } else {

          throw ServerException(0,
              'We regret the technical error. Please try again after some time.');
        }
      } else {
        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    }
  }


  Future<Response?> post(apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    Map<String, dynamic> headers = HashMap();

    String authorizationToken =

        "Bearer 5af2dc2fe6f85baff82bd02b407139f9aae9fe40";
      if (authorizationToken != null) {
        headers.putIfAbsent('authorization', () => authorizationToken);
      }


    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }

    try {
      Response response =
      await _dio!.request(apiName, data: body, options: option);

      if (response.statusCode == 400) {
        throw ServerException(response.statusCode!, response.statusMessage!);
      }

      if (response != null) {
        return response;
      } else {

        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    } catch (e) {
      if (e is DioError) {
        var error = e as DioError;

        if (error.response != null &&
            error.response!.statusCode != null &&
            error.response!.statusCode == 400 &&
            error.response!.data != null) {
          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        }

        if (error.response != null && error.response!.statusCode == 401) {
          if (error.response!.statusMessage != null &&
              error.response!.statusMessage!.isNotEmpty) return error.response;

        }

        if (error != null &&
            error.response != null &&
            error.response!.data != null) {
          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        } else {

          throw ServerException(0,
              'We regret the technical error. Please try again after some time.');
        }
      } else {

        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    }
  }



  void doLogout(context) async {

  }

  Future<Response?> delete(apiName,
      {body, Map<String, dynamic>? header, Options? option}) async {
    Map<String, dynamic> headers = HashMap();

    String authorizationToken =

        "Bearer 5af2dc2fe6f85baff82bd02b407139f9aae9fe40";
    if (authorizationToken != null) {
      headers.putIfAbsent('authorization', () => authorizationToken);
    }


    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "delete");
      option.headers = headers;
    }

    try {
      Response response =
      await _dio!.request(apiName, data: body, options: option);

      if (response.statusCode == 400) {
        throw ServerException(response.statusCode!, response.statusMessage!);
      }

      if (response != null) {
        return response;
      } else {

        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    } catch (e) {
      if (e is DioError) {
        var error = e as DioError;

        if (error.response != null &&
            error.response!.statusCode != null &&
            error.response!.statusCode == 400 &&
            error.response!.data != null) {
          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        }

        if (error.response != null && error.response!.statusCode == 401) {
          if (error.response!.statusMessage != null &&
              error.response!.statusMessage!.isNotEmpty) return error.response;

        }

        if (error != null &&
            error.response != null &&
            error.response!.data != null) {
          throw ServerException(
              error.response!.statusCode!, error.response!.statusMessage!);
        } else {

          throw ServerException(0,
              'We regret the technical error. Please try again after some time.');
        }
      } else {

        throw ServerException(0,
            'We regret the technical error. Please try again after some time.');
      }
    }
  }
}
final RestClient restClient = RestClient();
