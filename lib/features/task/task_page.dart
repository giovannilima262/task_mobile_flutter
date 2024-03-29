import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/task/task_controller.dart';
import 'package:task_mobile_giovanni/models/task_model.dart';
import 'package:task_mobile_giovanni/utils/show_dialogs.dart';
import 'package:task_mobile_giovanni/widgets/task_card.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
    this.taskController,
    this.formKey,
    this.titleController,
    this.descriptionController,
  });

  final GlobalKey<FormState>? formKey;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;

  final String title = "Tasks";

  final TaskController? taskController;

  @override
  Widget build(BuildContext context) {
    TaskController taskControllerLocal =
        taskController ?? Modular.get<TaskController>();

    GlobalKey<FormState> formKeyLocal = formKey ?? GlobalKey<FormState>();
    TextEditingController titleControllerLocal =
        titleController ?? TextEditingController();

    taskControllerLocal.updateTaskList();
    TextEditingController descriptionControllerLocal =
        descriptionController ?? TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          titleControllerLocal.clear();
          descriptionControllerLocal.clear();
          ShowDialogs.showModalAddTask(
            context,
            taskControllerLocal: taskControllerLocal,
            formKeyLocal: formKeyLocal,
            titleControllerLocal: titleControllerLocal,
            descriptionControllerLocal: descriptionControllerLocal,
          );
        },
      ),
      body: Observer(
        builder: (_) => RefreshIndicator(
          onRefresh: () async => taskControllerLocal.updateTaskList(),
          child: ListView.builder(
            itemCount: taskControllerLocal.list.length,
            itemBuilder: (context, index) {
              final TaskModel taskModel = taskControllerLocal
                  .list[taskControllerLocal.list.length - index - 1];
              return TaskCard(
                title: taskModel.title,
                description: taskModel.description,
                deleteAction: () => taskControllerLocal.deleteTask(
                  context: context,
                  taskModel: taskModel,
                ),
                editAction: () {
                  titleControllerLocal.text = taskModel.title;
                  descriptionControllerLocal.text = taskModel.description;
                  ShowDialogs.showModalEditTask(
                    context,
                    taskControllerLocal: taskControllerLocal,
                    formKeyLocal: formKeyLocal,
                    titleControllerLocal: titleControllerLocal,
                    descriptionControllerLocal: descriptionControllerLocal,
                    taskModel: taskModel,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
