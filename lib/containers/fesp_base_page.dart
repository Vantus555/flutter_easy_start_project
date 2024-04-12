import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_nav_bar.dart';
import 'package:flutter_easy_start_project/nodes/fesp_theme_tggler.dart';
import 'package:go_router/go_router.dart';

class FespBasePage extends StatelessWidget {
  final String? title;
  final StatefulNavigationShell child;
  const FespBasePage({
    super.key,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "FestApp"),
        actions: const [
          FespThemeToggler(),
          SizedBox(width: 20),
        ],
        scrolledUnderElevation: 0,
      ),
      body: child,
      bottomNavigationBar: FespBottomNavBar(child: child),
    );
  }
}
