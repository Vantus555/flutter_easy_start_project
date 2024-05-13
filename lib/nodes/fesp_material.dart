import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_material.g.dart';

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
          type: 'Widget',
          name: 'child',
        ),
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
      ],
    ),
  ],
  invalidTypes: ['\$FespMaterialBuilderData'],
)
class FespMaterialData extends _$FespMaterialData {
  final Widget child;

  const FespMaterialData({
    required this.child,
    super.fespBuilder0,
  });
}

class FespMaterial extends StatelessWidget {
  final FespMaterialData data;

  const FespMaterial({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return data._$fespBuilder0(
      context,
      $FespMaterialBuilderData(
        borderRadius: FESP_BORDER_RADIUS,
        elevation: FESP_MATERIAL_ELEVATION,
        shadowColor: FESP_SHADOW_COLOR(context),
        child: data.child,
      ),
    );
  }
}
