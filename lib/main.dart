import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/containers/fesp_app.dart';
import 'package:flutter_easy_start_project/containers/fesp_demo.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';

void main() {
  FespApp(
    data: FespAppData(
      navItems: [
        FespNavItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          title: "main",
          label: "main",
          child: const FespDemo(),
          path: '/',
        ),
        FespNavItem(
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings,
          title: "settings",
          label: "settings",
          child: const Text("2"),
          path: '/settings',
        ),
      ],
    ),
  );
}
