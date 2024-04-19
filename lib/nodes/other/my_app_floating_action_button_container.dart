import 'package:flutter/material.dart';
import 'package:nedoctor_pro/project/views/other/my_app_container_center.dart';

class MyAppFloatingActionButtonContainer extends StatelessWidget {
  final Widget child;
  final Widget action;

  const MyAppFloatingActionButtonContainer({
    super.key,
    required this.child,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyAppContainerCenter(
          child: child,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: action,
        ),
      ],
    );
  }
}
