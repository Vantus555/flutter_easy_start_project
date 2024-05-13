// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_responsive_layout_data.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:provider/provider.dart';

class FespResponsiveLayout extends StatelessWidget {
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;
  final bool parent;

  const FespResponsiveLayout({
    super.key,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.parent = true,
  }) : assert(
          xs != null ||
              sm != null ||
              md != null ||
              lg != null ||
              xl != null ||
              xxl != null,
          'At least one widget must be set!',
        );

  @override
  Widget build(BuildContext context) {
    final layouts = context.read<FespAppProvider>().data.responsiveData;
    if (parent) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.minWidth;

          return _getChild(layouts, width);
        },
      );
    }

    final width = MediaQuery.of(context).size.width;
    return _getChild(layouts, width);
  }

  Widget _getChild(FespResponsiveLayoutData layouts, double width) {
    Widget? res;

    if (width < layouts.sm) {
      res = xs ?? sm ?? md ?? lg ?? xl ?? xxl;
    } else if (width < layouts.md) {
      res = sm ?? md ?? lg ?? xl ?? xxl ?? xs;
    } else if (width < layouts.lg) {
      res = md ?? lg ?? xl ?? xxl ?? sm ?? xs;
    } else if (width < layouts.xl) {
      res = lg ?? xl ?? xxl ?? md ?? sm ?? xs;
    } else if (width < layouts.xxl) {
      res = xl ?? xxl ?? lg ?? md ?? sm ?? xs;
    } else {
      res = xxl ?? xl ?? lg ?? md ?? sm ?? xs;
    }

    return res!;
  }
}
