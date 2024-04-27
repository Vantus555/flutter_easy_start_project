import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespSlideUpPanel extends StatefulWidget {
  final Widget child;
  final Widget collapseArea;
  final Widget collapseChild;
  final double collapseGestureHeight;
  final double collapseChildHeight;
  final int milliseconds;
  final double sensitivity;

  const FespSlideUpPanel({
    super.key,
    this.collapseGestureHeight = 0.1,
    this.collapseChildHeight = 0.9,
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
      _ac.animateTo(widget.collapseChildHeight + widget.collapseGestureHeight);
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
              padding: EdgeInsets.only(bottom: widget.collapseGestureHeight),
              child: widget.child,
            ),
            _getMainArea(constraints),
          ],
        );
      },
    );
  }

  Widget _getMainArea(BoxConstraints constraints) {
    return AnimatedBuilder(
      animation: _ac,
      builder: (context, child) {
        final height = widget.collapseGestureHeight * constraints.maxWidth +
            (_ac.value * widget.collapseChildHeight * constraints.maxWidth);
        if (_ac.value == 0 || _ac.value == 1) {
          isAnimated = false;
        } else {
          isAnimated = true;
        }
        return Positioned(
          bottom: 0,
          child: Container(
            width: constraints.maxWidth,
            height: height,
            color: FESP_ACTIVE_COLOR(context),
            child: Wrap(
              children: [
                _getCollapseArea(constraints),
                _getCollapseChild(constraints),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getCollapseArea(BoxConstraints constraints) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < -widget.sensitivity) {
          _toogleAnimate(false);
        } else if (details.delta.dy > widget.sensitivity) {
          _toogleAnimate(true);
        }
      },
      child: Container(
        color: FESP_ACTIVE_COLOR(context),
        width: constraints.maxWidth,
        height: widget.collapseGestureHeight * constraints.maxHeight,
        child: Center(child: widget.collapseArea),
      ),
    );
  }

  Widget _getCollapseChild(BoxConstraints constraints) {
    return Container(
      height: widget.collapseChildHeight * constraints.maxHeight,
      child: FespContainer(child: widget.collapseChild),
    );
  }
}
