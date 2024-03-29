import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/task/task_repository.dart';
import 'package:task_mobile_giovanni/models/task_model.dart';

class TaskService {
  TaskService({
    this.taskRepository,
  }) {
    taskRepository = taskRepository ?? Modular.get<TaskRepository>();
  }

  TaskRepository? taskRepository;

  String? token;

  bool isLogged() => token != null && token!.isNotEmpty;

  Future<TaskModel> add({required TaskModel taskModel}) async {
    try {
      return await taskRepository!.add(taskModel: taskModel);
    } catch (_) {
      rethrow;
    }
  }

  Future<TaskModel> edit({required TaskModel taskModel}) async {
    try {
      return await taskRepository!.edit(taskModel: taskModel);
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> delete({required TaskModel taskModel}) async {
    try {
      return await taskRepository!.delete(taskModel: taskModel);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TaskModel>> all() async {
    try {
      return await taskRepository!.all();
    } catch (_) {
      rethrow;
    }
  }
}
