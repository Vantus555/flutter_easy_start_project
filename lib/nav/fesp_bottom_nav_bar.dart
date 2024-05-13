import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:go_router/go_router.dart';

class FespBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;
  final List<FespNavItemData>? navItems;

  const FespBottomNavBar({
    super.key,
    this.navItems,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (navItems == null || navItems!.length < 2) {
      return const SizedBox.shrink();
    }

    return _getBottomNavBar();
  }

  Widget _getBottomNavBar() {
    final List<BottomNavigationBarItem> items = [];

    for (var element in navItems!) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(element.icon),
          activeIcon: Icon(element.activeIcon),
          label: element.label,
        ),
      );
    }

    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      type: BottomNavigationBarType.fixed,
      currentIndex: child.currentIndex,
      onTap: (index) => child.goBranch(index),
      items: items,
    );
  }
}
