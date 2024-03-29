import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_mobile_giovanni/core/exceptions/g_http_exception.dart';
import 'package:task_mobile_giovanni/core/services/client_http/base/client_base.dart';

class ClientBaseImpl implements ClientBase {
  final Dio _dio;

  ClientBaseImpl(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
  }) : _dio = Dio(
          baseOptions,
        ) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  get httpsClientAdapter => _dio.httpClientAdapter;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      // log
      throw GHttpException(
        error: e.error?.toString(),
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: json.encode(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw GHttpException(
        error: e.error?.toString(),
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: json.encode(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw GHttpException(
        error: e.error?.toString(),
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw GHttpException(
        error: e.error?.toString(),
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }
}
