import 'package:flutter/material.dart';

class FespMultiScroll extends StatelessWidget {
  final bool horizontal;
  final bool vertical;
  final Widget child;

  const FespMultiScroll({
    super.key,
    this.horizontal = true,
    this.vertical = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController horizontalController = ScrollController();
    final ScrollController verticalController = ScrollController();

    Widget scroll = child;

    if (vertical && horizontal) {
      scroll = Scrollbar(
        controller: verticalController,
        child: Scrollbar(
          notificationPredicate: (notif) => notif.depth == 1,
          controller: horizontalController,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: verticalController,
            child: SingleChildScrollView(
              controller: horizontalController,
              scrollDirection: Axis.horizontal,
              child: child,
            ),
          ),
        ),
      );
    } else if (horizontal) {
      scroll = Scrollbar(
        controller: horizontalController,
        child: SingleChildScrollView(
          controller: horizontalController,
          scrollDirection: Axis.horizontal,
          child: child,
        ),
      );
    } else if (vertical) {
      scroll = Scrollbar(
        controller: verticalController,
        child: SingleChildScrollView(
          controller: verticalController,
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
    }

    return scroll;
  }
}
