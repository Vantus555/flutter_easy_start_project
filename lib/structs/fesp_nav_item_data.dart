import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FespNavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String title;
  final String? label;
  final String path;
  final String name;
  final Widget Function(BuildContext context, GoRouterState state) builder;
  final List<FespNavItemData>? routes;
  final bool isEnable;

  FespNavItemData({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.path,
    required this.name,
    required this.builder,
    this.label,
    this.routes,
    this.isEnable = true,
  });
}
