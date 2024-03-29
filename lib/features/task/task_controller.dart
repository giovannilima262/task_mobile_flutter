import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:task_mobile_giovanni/features/task/task_service.dart';
import 'package:task_mobile_giovanni/models/task_model.dart';
import 'package:task_mobile_giovanni/utils/constants.dart';

part 'task_controller.g.dart';

class TaskController = TaskControllerBase with _$TaskController;

abstract class TaskControllerBase with Store {
  TaskControllerBase({
    this.taskService,
  }) {
    taskService = taskService ?? Modular.get<TaskService>();
  }

  TaskService? taskService;

  @observable
  ObservableList<TaskModel> list = ObservableList<TaskModel>();

  @action
  void addedNewTask({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    Modular.to.pop();
    TaskModel taskModel = TaskModel(
      title: title,
      description: description,
    );
    taskService!.add(taskModel: taskModel).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.messageCreateTaskSuccess)),
      );
      list.add(value);
    });
  }

  @action
  void deleteTask({
    required BuildContext context,
    required TaskModel taskModel,
  }) {
    taskService!.delete(taskModel: taskModel).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.messageDeleteTaskSuccess)),
      );
      list.remove(taskModel);
    }).catchError((_) {
      updateTaskList();
    });
  }

  @action
  void editTask({
    required BuildContext context,
    required TaskModel taskModel,
  }) {
    Modular.to.pop();
    taskService!.edit(taskModel: taskModel).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.messageEditTaskSuccess)),
      );
      int index = list.indexWhere((element) => element.id == taskModel.id);
      list[index] = value;
    }).catchError((_) {
      updateTaskList();
    });
  }

  @action
  void updateTaskList() {
    taskService!.all().then((values) {
      list.clear();
      list.addAll(values);
    });
  }
}
