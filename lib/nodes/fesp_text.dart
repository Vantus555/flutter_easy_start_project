import 'package:flutter/material.dart';

class FespText extends StatelessWidget {
  final String? text;
  final SelectableText Function()? builder;
  final AlignmentGeometry alignment;

  const FespText(
      {super.key, this.text, this.alignment = Alignment.topLeft, this.builder})
      : assert(text != null || builder != null,
            "Onc of the text or builder can be set!");

  @override
  Widget build(BuildContext context) {
    SelectableText child = builder != null ? builder!() : SelectableText(text!);

    return Align(
      alignment: alignment,
      child: child,
    );
  }
}
