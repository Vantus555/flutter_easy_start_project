import 'package:flutter/material.dart';

class FespNode extends StatelessWidget {
  final Widget Function(Widget current, int index)? onCopyWith;
  const FespNode({super.key, this.onCopyWith});

  static Widget getTrueNode(FespNode node, Widget current, {int index = 0}) {
    return node.onCopyWith == null ? current : node.onCopyWith!(current, index);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
