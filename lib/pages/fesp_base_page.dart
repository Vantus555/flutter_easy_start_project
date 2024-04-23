import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';

class FespBasePage extends StatelessWidget {
  final List<FespNavItemData>? navItems;
  final Widget child;

  const FespBasePage({
    super.key,
    required this.navItems,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
