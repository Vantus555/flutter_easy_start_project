import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_nav_bar.dart';
import 'package:flutter_easy_start_project/nodes/fesp_responsive_layout.dart';
import 'package:flutter_easy_start_project/nodes/fesp_theme_tggler.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    return FespResponsiveLayout(
      md: _getScaffold(context),
      lg: _getScaffold(context, rail: true),
    );
  }

  Widget _getScaffold(
    BuildContext context, {
    bool rail = false,
  }) {
    final provider = context.read<FespAppProvider>();

    final nav = FespBottomNavBar(
      rail: rail,
      child: child,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "FestApp"),
        actions: const [
          FespThemeToggler(),
          SizedBox(width: 20),
        ],
        scrolledUnderElevation: 0,
      ),
      body: Row(
        children: [
          rail == true ? nav : const SizedBox.shrink(),
          Expanded(
            child: FespContainer(
              settings: provider.data.mainContainerData,
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: rail == false ? nav : null,
    );
  }
}
