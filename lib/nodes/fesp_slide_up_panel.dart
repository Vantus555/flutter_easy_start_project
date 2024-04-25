import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FespSlideUpPanel extends StatelessWidget {
  final Widget? body;
  final Widget? collapse;
  final Widget? collapseChild;

  const FespSlideUpPanel({
    super.key,
    this.body,
    this.collapse,
    this.collapseChild,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      renderPanelSheet: false,
      panel: _floatingPanel(context),
      collapsed: _floatingCollapsed(context),
      body: body,
    );
  }

  Widget _floatingCollapsed(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TAB_BAR_DEFAULT_COLOR(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
          topRight: Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
        ),
      ),
      margin: const EdgeInsets.only(
        left: SLIDE_PANEL_BORDER_RADIUS,
        right: SLIDE_PANEL_BORDER_RADIUS,
        top: SLIDE_PANEL_BORDER_RADIUS,
      ),
      child: collapse,
    );
  }

  Widget _floatingPanel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TAB_BAR_DEFAULT_COLOR(context),
        borderRadius: const BorderRadius.all(
          Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: FESP_SHADOW_COLOR(context),
          ),
        ],
      ),
      margin: const EdgeInsets.all(SLIDE_PANEL_BORDER_RADIUS),
      child: collapseChild,
    );
  }
}
