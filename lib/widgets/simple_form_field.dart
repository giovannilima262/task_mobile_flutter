import 'package:flutter/material.dart';

/// [TextFormField] customization
class SimpleFormField extends StatelessWidget {
  const SimpleFormField({
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.maxLength,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final int? maxLength;
  final int? maxLines;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: hintText,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
