import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespSlideUpPanel extends StatefulWidget {
  final Widget child;
  final Widget collapseArea;
  final Widget collapseChild;
  final double collapseGestureHeightRatio;
  final double collapseChildHeightRatio;
  final int milliseconds;
  final double sensitivity;

  const FespSlideUpPanel({
    super.key,
    this.collapseGestureHeightRatio = 0.07,
    this.collapseChildHeightRatio = 1,
    this.milliseconds = 300,
    this.sensitivity = 20,
    required this.collapseArea,
    required this.collapseChild,
    required this.child,
  });

  @override
  State<FespSlideUpPanel> createState() => _FespSlideUpPanelState();
}

class _FespSlideUpPanelState extends State<FespSlideUpPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac;
  bool isOpen = false;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();

    _ac = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.milliseconds),
    );
  }

  void _toogleAnimate(bool direct) {
    if (isOpen && direct && !isAnimated) {
      _ac.animateBack(0);
    } else if (!isOpen && !direct && !isAnimated) {
      _ac.animateTo(1);
    }
    isOpen = !isOpen;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: widget.collapseGestureHeightRatio,
              ),
              child: widget.child,
            ),
            _getCollapseArea(constraints),
            _getCollapseChild(constraints),
          ],
        );
      },
    );
  }

  double _getCollapseGestureHeight(BoxConstraints constraints) {
    return widget.collapseGestureHeightRatio * constraints.maxHeight;
  }

  double _getCollapseChildHeight(BoxConstraints constraints) {
    return widget.collapseChildHeightRatio * constraints.maxHeight;
  }

  double _getAnimationHeight(BoxConstraints constraints) {
    return _ac.value *
        widget.collapseChildHeightRatio *
        (constraints.maxHeight - _getCollapseGestureHeight(constraints));
  }

  Widget _getCollapseArea(BoxConstraints constraints) {
    return AnimatedBuilder(
      animation: _ac,
      builder: (context, child) {
        if (_ac.value == 0 || _ac.value == 1) {
          isAnimated = false;
        } else {
          isAnimated = true;
        }
        return Positioned(
          bottom: _getAnimationHeight(constraints),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < -widget.sensitivity) {
                _toogleAnimate(false);
              } else if (details.delta.dy > widget.sensitivity) {
                _toogleAnimate(true);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
                  topRight: Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
                ),
                color: Color.fromARGB(255, 52, 50, 50),
              ),
              width: constraints.maxWidth,
              height: _getCollapseGestureHeight(constraints),
              child: Center(child: widget.collapseArea),
            ),
          ),
        );
      },
    );
  }

  Widget _getCollapseChild(BoxConstraints constraints) {
    return AnimatedBuilder(
      animation: _ac,
      builder: (context, child) {
        final height = -_getCollapseChildHeight(constraints) +
            _getAnimationHeight(constraints);
        return Positioned(
          bottom: height,
          child: Container(
            color: FESP_TAB_BAR_COLOR(context),
            width: constraints.maxWidth,
            height: _getCollapseChildHeight(constraints),
            child: FespContainer(
              child: widget.collapseChild,
            ),
          ),
        );
      },
    );
  }
}
