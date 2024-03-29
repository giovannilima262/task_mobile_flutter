import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/task/task_controller.dart';
import 'package:task_mobile_giovanni/models/task_model.dart';
import 'package:task_mobile_giovanni/utils/constants.dart';
import 'package:task_mobile_giovanni/utils/helpers.dart';
import 'package:task_mobile_giovanni/widgets/simple_form_field.dart';
import 'package:task_mobile_giovanni/widgets/simple_outlined_button.dart';
import 'package:task_mobile_giovanni/widgets/task_card_form.dart';

class ShowDialogs {
  static void showModalAddTask(
    BuildContext context, {
    required TaskController taskControllerLocal,
    required GlobalKey<FormState> formKeyLocal,
    required TextEditingController titleControllerLocal,
    required TextEditingController descriptionControllerLocal,
  }) {
    showModalTask(
      context,
      dialogTitle: Constants.titleAddTask,
      taskControllerLocal: taskControllerLocal,
      formKeyLocal: formKeyLocal,
      titleControllerLocal: titleControllerLocal,
      descriptionControllerLocal: descriptionControllerLocal,
      simpleConfirmButton: SimpleOutlinedButton(
        backgroundColor: Colors.transparent,
        child: const Text(Constants.confirm),
        onPressed: () {
          if (!formKeyLocal.currentState!.validate()) return;
          taskControllerLocal.addedNewTask(
            context: context,
            title: titleControllerLocal.text,
            description: descriptionControllerLocal.text,
          );
        },
      ),
    );
  }

  static void showModalEditTask(
    BuildContext context, {
    required TaskModel taskModel,
    required TaskController taskControllerLocal,
    required GlobalKey<FormState> formKeyLocal,
    required TextEditingController titleControllerLocal,
    required TextEditingController descriptionControllerLocal,
  }) {
    showModalTask(
      context,
      dialogTitle: Constants.titleEditTask,
      taskControllerLocal: taskControllerLocal,
      formKeyLocal: formKeyLocal,
      titleControllerLocal: titleControllerLocal,
      descriptionControllerLocal: descriptionControllerLocal,
      simpleConfirmButton: SimpleOutlinedButton(
        backgroundColor: Colors.transparent,
        child: const Text(Constants.confirm),
        onPressed: () {
          if (!formKeyLocal.currentState!.validate()) return;
          taskModel.title = titleControllerLocal.text;
          taskModel.description = descriptionControllerLocal.text;
          taskControllerLocal.editTask(
            context: context,
            taskModel: taskModel,
          );
        },
      ),
    );
  }

  static void showModalTask(
    BuildContext context, {
    required String dialogTitle,
    required TaskController taskControllerLocal,
    required GlobalKey<FormState> formKeyLocal,
    required TextEditingController titleControllerLocal,
    required TextEditingController descriptionControllerLocal,
    required SimpleOutlinedButton simpleConfirmButton,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SingleChildScrollView(
              child: TaskCardForm(
                formKey: formKeyLocal,
                title: dialogTitle,
                titleSimpleFormField: SimpleFormField(
                  controller: titleControllerLocal,
                  maxLength: 50,
                  hintText: Constants.hintFieldTitle,
                  validator: Helpers.textValidator,
                ),
                descriptionSimpleFormField: SimpleFormField(
                  controller: descriptionControllerLocal,
                  maxLength: 255,
                  maxLines: 2,
                  hintText: Constants.hintFieldDescription,
                  validator: Helpers.textValidator,
                ),
                bottomChild: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SimpleOutlinedButton(
                      color: Colors.red,
                      backgroundColor: Colors.transparent,
                      onPressed: () => Modular.to.pop(),
                      child: const Text(Constants.cancel),
                    ),
                    simpleConfirmButton,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
