import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FespBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;
  final bool rail;

  const FespBottomNavBar({
    super.key,
    required this.rail,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FespAppProvider>();

    if (provider.data.navItems == null || provider.data.navItems!.length < 2) {
      return const SizedBox.shrink();
    }

    if (rail) return _getNavRail(provider);

    return _getBottomNavBar(provider);
  }

  Widget _getNavRail(FespAppProvider provider) {
    final List<NavigationRailDestination> items = [];

    for (var element in provider.data.navItems!) {
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

  Widget _getBottomNavBar(FespAppProvider provider) {
    final List<BottomNavigationBarItem> items = [];

    for (var element in provider.data.navItems!) {
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
