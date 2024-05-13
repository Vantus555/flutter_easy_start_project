import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:fesp_node_builders/fesp_node_classes.dart';

part 'fesp_list_tile.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespListTileBuilderData',
      returnType: 'ListTile',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'title',
        ),
        FespNodeBuilderClassField(
          type: 'Widget?',
          name: 'leading',
        ),
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'trailing',
        ),
        FespNodeBuilderClassField(
          type: 'ShapeBorder',
          name: 'shape',
        ),
        FespNodeBuilderClassField(
          type: 'void Function()?',
          name: 'onTap',
        ),
      ],
    ),
  ],
  invalidTypes: ['EdgeInsetsGeometry'],
)
class FespListTileData extends _$FespListTileData {
  final bool material;
  final Widget title;
  final Function() onTap;
  final Widget trailing;
  final Widget? leading;
  final EdgeInsetsGeometry padding;

  const FespListTileData({
    required this.title,
    required this.onTap,
    this.trailing = const Icon(Icons.keyboard_arrow_right_outlined),
    this.leading,
    this.material = true,
    this.padding = const EdgeInsets.all(5),
    super.fespBuilder0,
  });
}

class FespListTile extends StatelessWidget {
  final FespListTileData data;

  const FespListTile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var list = data._$fespBuilder0(
      context,
      $FespListTileBuilderData(
        leading: data.leading,
        shape: FESP_SHAPE,
        title: data.title,
        trailing: data.trailing,
        onTap: data.onTap,
      ),
    );

    if (data.material) {
      return Padding(
        padding: data.padding,
        child: FespMaterial(
          data: FespMaterialData(child: list),
        ),
      );
    } else {
      return Padding(
        padding: data.padding,
        child: list,
      );
    }
  }
}
