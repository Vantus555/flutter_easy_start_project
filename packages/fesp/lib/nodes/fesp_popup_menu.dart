import 'package:flutter/material.dart';
import 'package:fesp_node_builders/fesp_node_classes.dart';

part 'fesp_popup_menu.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespMenuAnchorBuilderData',
      returnType: 'MenuAnchor',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget Function(BuildContext, MenuController, Widget?)',
          name: 'builder',
        ),
        FespNodeBuilderClassField(
          type: 'List<Widget>',
          name: 'menuChildren',
        ),
      ],
    ),
    FespNodeBuilderField(
      className: 'FespMenuItemButtonData',
      returnType: 'MenuItemButton',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
        FespNodeBuilderClassField(
          type: 'void Function()',
          name: 'onPressed',
        ),
      ],
    ),
  ],
)
class FespPopupMenuData extends _$FespPopupMenuData {
  final Map<Object, Widget> items;
  final Function(Object value) onChange;

  const FespPopupMenuData({
    required this.items,
    required this.onChange,
    super.fespBuilder0,
    super.fespBuilder1,
  });
}

class FespPopupMenu<T> extends StatelessWidget {
  final FespPopupMenuData data;

  const FespPopupMenu({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return data._$fespBuilder0(
      context,
      $FespMenuAnchorBuilderData(
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
        menuChildren: data.items.entries
            .map((e) => data._$fespBuilder1(
                  context,
                  $FespMenuItemButtonData(
                    onPressed: () => data.onChange(e.key),
                    child: e.value,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
