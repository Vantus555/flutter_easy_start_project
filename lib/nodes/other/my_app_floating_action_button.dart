import 'package:flutter/material.dart';

class MyAppFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final bool mini;
  final EdgeInsetsGeometry padding;

  const MyAppFloatingActionButton({
    super.key,
    this.mini = false,
    required this.icon,
    required this.onPressed,
    this.padding = const EdgeInsets.all(10.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FloatingActionButton(
        mini: mini,
        onPressed: onPressed,
        shape: const CircleBorder(),
        child: Icon(icon),
      ),
    );
  }
}
