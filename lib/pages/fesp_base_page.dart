import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nav/fesp_local_nav.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_theme_toggler.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:provider/provider.dart';

class FespBasePage extends StatelessWidget {
  final FespNavItemData navItem;
  final Widget child;

  const FespBasePage({
    super.key,
    required this.navItem,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FespAppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: FespLocalNav(
          navItems: navItem.routes,
          title: navItem.title,
        ),
        actions: const [
          FespThemeToggler(),
          SizedBox(width: 20),
        ],
        scrolledUnderElevation: 0,
      ),
      body: FespContainer(
        data: provider.data.mainContainerData,
        child: child,
      ),
    );
  }
}
