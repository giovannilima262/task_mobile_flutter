import 'package:flutter/material.dart';

/// A widget with button refresh
class RefreshPage extends StatelessWidget {
  const RefreshPage({
    required this.onPressed,
    super.key,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
          label: const Text("Refresh"),
        ),
      ),
    );
  }
}
