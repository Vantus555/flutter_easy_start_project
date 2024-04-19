import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_builders.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'fesp_material.g.dart';

// @CopyWith()
class FespMaterialBuilderData {
  final BuildContext context;
  final BorderRadius borderRadius;
  final double elevation;
  final Color shadowColor;
  final Widget? child;

  FespMaterialBuilderData({
    required this.context,
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
    this.child,
  });
}

@FespNodeBuildersA()
class FespMaterial extends StatelessWidget {
  final Widget child;

  @FespNodeBuilderFieldA(
    classFields: [
      'borderRadius',
      'elevation',
      'shadowColor',
    ],
  )
  final Material Function(
    FespMaterialBuilderData data,
  )? fespBuilder1;

  const FespMaterial({
    super.key,
    this.fespBuilder1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _$fespBuilder1(
      FespMaterialBuilderData(
        context: context,
        borderRadius: FESP_BORDER_RADIUS,
        elevation: FESP_MATERIAL_ELEVATION,
        shadowColor: FESP_SHADOW_COLOR(context),
        child: child,
      ),
    );
  }
}
