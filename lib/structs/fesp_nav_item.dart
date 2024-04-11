import 'package:flutter/material.dart';

class FespNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String title;
  final String? label;
  final String path;
  final Widget child;
  final List<FespNavItem>? routes;

  FespNavItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
    this.label,
    required this.path,
    required this.child,
    this.routes,
  });
}
