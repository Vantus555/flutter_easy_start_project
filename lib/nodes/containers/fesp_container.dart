// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_responsive_layout.dart';
import 'package:flutter_easy_start_project/structs/fesp_responsive_layout_data.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_container.g.dart';

enum FespContainerSize {
  FILL,
  XXL,
  XL,
  LG,
  MD,
  SM,
}

enum FespContainerType {
  USUAL,
  FIXED,
}

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespContainerBuilderData',
      returnType: 'SizedBox',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
        FespNodeBuilderClassField(
          type: 'double',
          name: 'width',
        ),
        FespNodeBuilderClassField(
          type: 'double?',
          name: 'height',
        ),
      ],
    ),
  ],
)
class FespContainerData extends _$FespContainerData {
  final FespContainerSize size;
  final FespContainerType type;
  final double padding;
  final double margin;
  final double? height;

  const FespContainerData({
    this.size = FespContainerSize.FILL,
    this.type = FespContainerType.USUAL,
    this.margin = 8,
    this.padding = 8,
    this.height,
    super.fespBuilder0,
  });
}

class FespContainer extends StatefulWidget {
  final FespContainerData data;
  final Widget? child;

  const FespContainer({
    super.key,
    this.data = const FespContainerData(),
    this.child,
  });

  @override
  State<FespContainer> createState() => _FespContainerState();
}

class _FespContainerState extends State<FespContainer> {
  @override
  Widget build(BuildContext context) {
    final layouts = context.read<FespAppProvider>().data.responsiveData;

    if (widget.data.type == FespContainerType.FIXED) {
      return _getFixed(layouts);
    }
    return _getUsual(layouts);
  }

  Widget _getFixed(FespResponsiveLayoutData layouts) {
    switch (widget.data.size) {
      case FespContainerSize.XXL:
        return FespResponsiveLayout(
          xl: _getContainer(double.infinity),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.XL:
        return FespResponsiveLayout(
          lg: _getContainer(double.infinity),
          xl: _getContainer(layouts.xl),
        );
      case FespContainerSize.LG:
        return FespResponsiveLayout(
          md: _getContainer(double.infinity),
          lg: _getContainer(layouts.lg),
        );
      case FespContainerSize.MD:
        return FespResponsiveLayout(
          sm: _getContainer(double.infinity),
          md: _getContainer(layouts.md),
        );
      case FespContainerSize.SM:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          sm: _getContainer(layouts.sm),
        );
      default:
        return _getContainer(double.infinity);
    }
  }

  Widget _getUsual(FespResponsiveLayoutData layouts) {
    switch (widget.data.size) {
      case FespContainerSize.XXL:
        return FespResponsiveLayout(
          xl: _getContainer(double.infinity),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.XL:
        return FespResponsiveLayout(
          lg: _getContainer(double.infinity),
          xl: _getContainer(layouts.xl),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.LG:
        return FespResponsiveLayout(
          md: _getContainer(double.infinity),
          lg: _getContainer(layouts.lg),
          xl: _getContainer(layouts.xl),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.MD:
        return FespResponsiveLayout(
          sm: _getContainer(double.infinity),
          md: _getContainer(layouts.md),
          lg: _getContainer(layouts.lg),
          xl: _getContainer(layouts.xl),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.SM:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          sm: _getContainer(layouts.sm),
          md: _getContainer(layouts.md),
          lg: _getContainer(layouts.lg),
          xl: _getContainer(layouts.xl),
          xxl: _getContainer(layouts.xxl),
        );
      default:
        return _getContainer(double.infinity);
    }
  }

  Widget _getContainer(double size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(widget.data.margin),
        // ignore: sized_box_for_whitespace
        child: widget.data._$fespBuilder0(
          context,
          $FespContainerBuilderData(
            child: Padding(
              padding: EdgeInsets.all(widget.data.padding),
              child: widget.child,
            ),
            width: size,
            height: widget.data.height,
          ),
        ),
      ),
    );
  }
}
