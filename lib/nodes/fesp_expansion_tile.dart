import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_expansion_tile.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespExpansionTileBuilderData',
      returnType: 'ExpansionTile',
      classFields: [
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
        FespNodeBuilderClassField(
          type: 'List<Widget>',
          name: 'children',
        ),
      ],
    ),
  ],
  invalidTypes: ['\$FespExpansionTileBuilderData'],
)
class FespExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final Widget title;
  final bool material;
  final EdgeInsetsGeometry padding;
  final ExpansionTile Function(
    BuildContext context,
    $FespExpansionTileBuilderData data,
  )? fespBuilder0;

  const FespExpansionTile({
    super.key,
    required this.title,
    this.children = const [],
    this.material = true,
    this.padding = FESP_TILE_PADDING,
    this.fespBuilder0,
  });

  @override
  Widget build(BuildContext context) {
    var child = _$fespBuilder0(
      context,
      $FespExpansionTileBuilderData(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: FESP_CHILDREN_PADDING,
        title: title,
        backgroundColor: FESP_EXPANSION_COLOR(context),
        children: children,
      ),
    );

    if (material) {
      return Padding(
        padding: padding,
        child: FespMaterial(
          child: child,
        ),
      );
    } else {
      return Padding(
        padding: padding,
        child: child,
      );
    }
  }
}
