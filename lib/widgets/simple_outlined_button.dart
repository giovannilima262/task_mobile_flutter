import 'package:flutter/material.dart';

/// [OutlinedButton] customization
class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton({
    required this.onPressed,
    required this.child,
    this.color = Colors.green,
    this.backgroundColor = Colors.white,
    super.key,
  });

  final Function()? onPressed;
  final Widget child;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: color)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(color),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return color.withOpacity(0.04);
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return color.withOpacity(0.12);
            }
            return null;
          },
        ),
      ),
      child: child,
    );
  }
}
