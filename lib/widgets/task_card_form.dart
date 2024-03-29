import 'package:flutter/material.dart';
import 'package:task_mobile_giovanni/widgets/simple_form_field.dart';

/// [Form] customization
class TaskCardForm extends StatelessWidget {
  const TaskCardForm({
    required this.title,
    required this.titleSimpleFormField,
    required this.descriptionSimpleFormField,
    required this.bottomChild,
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final String title;
  final SimpleFormField titleSimpleFormField;
  final SimpleFormField descriptionSimpleFormField;
  final Widget bottomChild;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            titleSimpleFormField,
            const SizedBox(height: 20),
            descriptionSimpleFormField,
            const SizedBox(height: 20),
            bottomChild,
          ],
        ),
      ),
    );
  }
}
