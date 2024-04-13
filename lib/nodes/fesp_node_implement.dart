import 'package:flutter/material.dart';

class FespNode extends StatelessWidget {
  final Widget Function(Widget current, int index)? onCopyWith;
  const FespNode({super.key, this.onCopyWith});

  Widget getTrueNode(Widget current, {int index = 0}) {
    return onCopyWith == null ? current : onCopyWith!(current, index);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
