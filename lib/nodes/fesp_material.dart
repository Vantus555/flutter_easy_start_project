import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_material.g.dart';

class FespMaterialBuilderData {
  final BorderRadius borderRadius;
  final double elevation;
  final Color shadowColor;
  final Widget? child;

  FespMaterialBuilderData({
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
    this.child,
  });
}

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespMaterialBuilderData',
      argsList: [
        'BuildContext',
        '\$FespMaterialBuilderData',
      ],
      returnType: 'Material',
      classFields: [
        FespNodeBuilderClassField(
          type: 'BorderRadius',
          name: 'borderRadius',
        ),
        FespNodeBuilderClassField(
          type: 'double',
          name: 'elevation',
        ),
        FespNodeBuilderClassField(
          type: 'Color',
          name: 'shadowColor',
        ),
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
      ],
    ),
  ],
  invalidTypes: ['\$FespMaterialBuilderData'],
)
class FespMaterial extends StatelessWidget {
  final Widget child;

  final Material Function(
    BuildContext context,
    $FespMaterialBuilderData data,
  )? fespBuilder0;

  const FespMaterial({
    super.key,
    this.fespBuilder0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _$fespBuilder0(
      context,
      $FespMaterialBuilderData(
        borderRadius: FESP_BORDER_RADIUS,
        elevation: FESP_MATERIAL_ELEVATION,
        shadowColor: FESP_SHADOW_COLOR(context),
        child: child,
      ),
    );
  }
}
