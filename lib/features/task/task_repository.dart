import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/core/services/client_http/client_https.dart';
import 'package:task_mobile_giovanni/features/login/login_service.dart';
import 'package:task_mobile_giovanni/models/task_model.dart';

class TaskRepository {
  TaskRepository({
    this.clientHttps,
  }) {
    clientHttps = clientHttps ?? Modular.get<ClientHttps>();
  }

  ClientHttps? clientHttps;

  Future<TaskModel> add({required TaskModel taskModel}) async {
    try {
      String endpoint = 'tasks';
      final result = await clientHttps!.post(
        endpoint,
        data: taskModel.toMapCreate(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Modular.get<LoginService>().token}',
          },
        ),
      );
      if (!result.data['status']) throw Exception(); // TODO added error status

      return TaskModel.fromMap(result.data['task']);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TaskModel>> all() async {
    try {
      String endpoint = 'tasks';
      final result = await clientHttps!.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Modular.get<LoginService>().token}',
          },
        ),
      );
      if (!result.data['status']) throw Exception(); // TODO added error status

      return (result.data['tasks'] as List)
          .map((e) => TaskModel.fromMap(e))
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<TaskModel> edit({required TaskModel taskModel}) async {
    try {
      String endpoint = 'tasks/${taskModel.id}';
      final result = await clientHttps!.put(
        endpoint,
        data: taskModel.toMapCreate(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Modular.get<LoginService>().token}',
          },
        ),
      );
      return TaskModel.fromMap(result.data['task']);
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> delete({required TaskModel taskModel}) async {
    try {
      String endpoint = 'tasks/${taskModel.id}';
      await clientHttps!.delete(
        endpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Modular.get<LoginService>().token}',
          },
        ),
      );
      return true;
    } catch (_) {
      rethrow;
    }
  }
}
