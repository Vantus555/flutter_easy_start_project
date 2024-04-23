import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:go_router/go_router.dart';

class FespLocalNav extends StatelessWidget {
  final double? tabHeight;
  final List<FespNavItemData>? navItems;
  final int currentIndex;

  const FespLocalNav({
    super.key,
    this.tabHeight = 32,
    this.navItems,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // if (navItems == null) return const SizedBox.shrink();

    // final List<Widget> children = [];
    // for (var i = 0; i < navItems!.length; i++) {
    //   children.add(
    //     TextButton(
    //       onPressed: () => context.goNamed(navItems![i].name),
    //       child: Text(navItems![i].title),
    //     ),
    //   );
    // }

    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: Text('hello'),
    );
  }
}
