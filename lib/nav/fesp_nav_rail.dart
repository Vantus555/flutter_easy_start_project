import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:go_router/go_router.dart';

class FespNavRail extends StatelessWidget {
  final StatefulNavigationShell child;
  final List<FespNavItemData>? navItems;

  const FespNavRail({
    super.key,
    this.navItems,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (navItems == null || navItems!.length < 2) {
      return const SizedBox.shrink();
    }

    return _getNavRail();
  }

  Widget _getNavRail() {
    final List<NavigationRailDestination> items = [];

    for (var element in navItems!) {
      items.add(
        NavigationRailDestination(
          icon: Icon(element.icon),
          selectedIcon: Icon(element.activeIcon),
          label: const Text(''),
        ),
      );
    }

    return NavigationRail(
      labelType: NavigationRailLabelType.none,
      destinations: items,
      selectedIndex: child.currentIndex,
      onDestinationSelected: (index) => child.goBranch(index),
    );
  }
}
