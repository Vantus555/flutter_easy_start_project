import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FespBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell child;

  const FespBottomNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FespAppProvider>();

    if (provider.data == null ||
        provider.data!.navItems == null ||
        provider.data!.navItems!.length < 2) {
      return const SizedBox.shrink();
    }

    final List<BottomNavigationBarItem> items = [];

    for (var element in provider.data!.navItems!) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(element.icon),
          activeIcon: Icon(element.activeIcon),
          label: element.label,
        ),
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: child.currentIndex,
      onTap: (index) => child.goBranch(index),
      items: items,
    );
  }
}
