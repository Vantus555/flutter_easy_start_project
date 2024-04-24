import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:go_router/go_router.dart';

class FespLocalNav extends StatelessWidget {
  final List<FespNavItemData>? navItems;
  final String? title;

  const FespLocalNav({
    super.key,
    this.navItems,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (title != null) {
      children.add(Text(title!));
      children.add(const SizedBox(width: 20));
    }

    if (navItems != null) {
      for (var i = 0; i < navItems!.length; i++) {
        children.add(
          TextButton(
            onPressed: () => context.goNamed(navItems![i].name),
            child: Text(navItems![i].title),
          ),
        );
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
      ),
    );
  }
}
