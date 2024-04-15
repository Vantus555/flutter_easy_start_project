// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:provider/provider.dart';

class FespResponsiveLayout extends StatelessWidget {
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;

  const FespResponsiveLayout({
    super.key,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final layouts = context.read<FespAppProvider>().data.responsiveData;
        final width = constraints.minWidth;

        if (width < layouts.sm) return _getLayoutWidget();
        if (width <= layouts.md) return _getLayoutWidget(offset: 1);
        if (width <= layouts.lg) return _getLayoutWidget(offset: 2);
        if (width <= layouts.xl) return _getLayoutWidget(offset: 3);
        if (width <= layouts.xxl)
          return _getLayoutWidget(offset: 4);
        else
          return _getLayoutWidget(offset: 5);
      },
    );
  }

  Widget _getLayoutWidget({int offset = 0}) {
    final widgets = [xs, sm, md, lg, xl, xxl];

    for (var i = offset; i < widgets.length; i++) {
      if (widgets[i] != null) return widgets[i]!;
    }
    for (var i = offset - 1; i >= 0; i--) {
      if (widgets[i] != null) return widgets[i]!;
    }
    return const SizedBox.shrink();
  }
}
