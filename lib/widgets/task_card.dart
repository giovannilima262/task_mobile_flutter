import 'package:flutter/material.dart';
import 'package:task_mobile_giovanni/widgets/simple_outlined_button.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.title,
    required this.description,
    required this.deleteAction,
    required this.editAction,
    super.key,
  });

  final String title;
  final String description;
  final Function()? deleteAction;
  final Function()? editAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SimpleOutlinedButton(
                  onPressed: editAction,
                  color: Colors.purple,
                  backgroundColor: Colors.transparent,
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(width: 8),
                SimpleOutlinedButton(
                  onPressed: deleteAction,
                  color: Colors.red,
                  backgroundColor: Colors.transparent,
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
