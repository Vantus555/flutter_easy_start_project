// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_node_implement.dart';
import 'package:flutter_easy_start_project/nodes/fesp_responsive_layout.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:provider/provider.dart';

enum FespContainerSize {
  FILL_CONTAINER,
  XXL_CONTAINER,
  XL_CONTAINER,
  LG_CONTAINER,
  MD_CONTAINER,
  SM_CONTAINER,
}

class FespContainer extends FespNode {
  final FespContainerSize containerSize;
  final Widget child;

  const FespContainer({
    super.key,
    super.onCopyWith,
    this.containerSize = FespContainerSize.FILL_CONTAINER,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final layouts = context.read<FespAppProvider>().data.responsiveData;

    switch (containerSize) {
      case FespContainerSize.XXL_CONTAINER:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          xl: _getContainer(double.infinity),
          xxl: _getContainer(layouts.xxl),
        );
      case FespContainerSize.XL_CONTAINER:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          lg: _getContainer(double.infinity),
          xl: _getContainer(layouts.xl),
          xxl: _getContainer(layouts.xl),
        );
      case FespContainerSize.LG_CONTAINER:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          md: _getContainer(double.infinity),
          lg: _getContainer(layouts.lg),
          xxl: _getContainer(layouts.lg),
        );
      case FespContainerSize.MD_CONTAINER:
        return FespResponsiveLayout(
          xs: _getContainer(double.infinity),
          sm: _getContainer(double.infinity),
          md: _getContainer(layouts.md),
          xxl: _getContainer(layouts.md),
        );
      case FespContainerSize.SM_CONTAINER:
        return FespResponsiveLayout(
          xs: _getContainer(layouts.sm),
          xxl: _getContainer(layouts.sm),
        );
      default:
        return _getContainer(double.infinity);
    }
  }

  Widget _getContainer(double size) {
    return getTrueNode(
      Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: size,
          child: child,
        ),
      ),
    );
  }
}
