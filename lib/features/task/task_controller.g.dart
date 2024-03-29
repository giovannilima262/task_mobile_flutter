// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on TaskControllerBase, Store {
  late final _$listAtom =
      Atom(name: 'TaskControllerBase.list', context: context);

  @override
  ObservableList<TaskModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<TaskModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$TaskControllerBaseActionController =
      ActionController(name: 'TaskControllerBase', context: context);

  @override
  void addedNewTask(
      {required BuildContext context,
      required String title,
      required String description}) {
    final _$actionInfo = _$TaskControllerBaseActionController.startAction(
        name: 'TaskControllerBase.addedNewTask');
    try {
      return super.addedNewTask(
          context: context, title: title, description: description);
    } finally {
      _$TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(
      {required BuildContext context, required TaskModel taskModel}) {
    final _$actionInfo = _$TaskControllerBaseActionController.startAction(
        name: 'TaskControllerBase.deleteTask');
    try {
      return super.deleteTask(context: context, taskModel: taskModel);
    } finally {
      _$TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask({required BuildContext context, required TaskModel taskModel}) {
    final _$actionInfo = _$TaskControllerBaseActionController.startAction(
        name: 'TaskControllerBase.editTask');
    try {
      return super.editTask(context: context, taskModel: taskModel);
    } finally {
      _$TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTaskList() {
    final _$actionInfo = _$TaskControllerBaseActionController.startAction(
        name: 'TaskControllerBase.updateTaskList');
    try {
      return super.updateTaskList();
    } finally {
      _$TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
