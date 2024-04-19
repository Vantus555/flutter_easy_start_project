import 'package:flutter/material.dart';

class MyAppPopupMenu<T> extends StatelessWidget {
  final Map<T, Widget> items;
  final Function(T value) onChange;

  const MyAppPopupMenu({
    super.key,
    required this.items,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_horiz),
          tooltip: 'Show menu',
        );
      },
      menuChildren: items.entries
          .map(
            (e) => MenuItemButton(
              onPressed: () => onChange(e.key),
              child: e.value,
            ),
          )
          .toList(),
    );
  }
}
