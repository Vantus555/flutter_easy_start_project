import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nav/fesp_nav_rail.dart';
import 'package:flutter_easy_start_project/nav/fesp_bottom_nav_bar.dart';
import 'package:flutter_easy_start_project/nodes/fesp_responsive_layout.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FespSkeletonPage extends StatelessWidget {
  // final String? title;
  final StatefulNavigationShell child;

  const FespSkeletonPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FespAppProvider>();
    final bar = FespBottomNavBar(
      navItems: provider.data.navItems,
      child: child,
    );
    final rail = FespNavRail(
      navItems: provider.data.navItems,
      child: child,
    );

    return FespResponsiveLayout(
      md: _getScaffold(context, bar: bar),
      lg: _getScaffold(context, rail: rail),
    );
  }

  Widget _getScaffold(
    BuildContext context, {
    FespNavRail? rail,
    FespBottomNavBar? bar,
  }) {
    return Scaffold(
      body: Row(
        children: [
          rail ?? const SizedBox.shrink(),
          Expanded(
            child: child,
          ),
        ],
      ),
      bottomNavigationBar: bar,
    );
  }
}
