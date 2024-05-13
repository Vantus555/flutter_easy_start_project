import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:fesp_node_builders/fesp_node_classes.dart';

part 'fesp_expansion_tile.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespExpansionTileBuilderData',
      returnType: 'ExpansionTile',
      classFields: [
        FespNodeBuilderClassField(
          type: 'List<Widget>',
          name: 'children',
        ),
        FespNodeBuilderClassField(
          type: 'CrossAxisAlignment',
          name: 'expandedCrossAxisAlignment',
        ),
        FespNodeBuilderClassField(
          type: 'Alignment',
          name: 'expandedAlignment',
        ),
        FespNodeBuilderClassField(
          type: 'EdgeInsetsGeometry',
          name: 'childrenPadding',
        ),
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'title',
        ),
        FespNodeBuilderClassField(
          type: 'Color',
          name: 'backgroundColor',
        ),
      ],
    ),
  ],
  invalidTypes: ['\$FespExpansionTileBuilderData'],
)
class FespExpansionTileData extends _$FespExpansionTileData {
  final List<Widget> children;
  final Widget title;
  final bool material;
  final EdgeInsetsGeometry padding;

  const FespExpansionTileData({
    required this.title,
    this.children = const [],
    this.material = true,
    this.padding = FESP_TILE_PADDING,
    super.fespBuilder0,
  });
}

class FespExpansionTile extends StatelessWidget {
  final FespExpansionTileData data;

  const FespExpansionTile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var child = data._$fespBuilder0(
      context,
      $FespExpansionTileBuilderData(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: FESP_CHILDREN_PADDING,
        title: data.title,
        backgroundColor: FESP_EXPANSION_COLOR(context),
        children: data.children,
      ),
    );

    if (data.material) {
      return Padding(
        padding: data.padding,
        child: FespMaterial(
          data: FespMaterialData(child: child),
        ),
      );
    } else {
      return Padding(
        padding: data.padding,
        child: child,
      );
    }
  }
}
