import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';

class FespPresentationBasePage extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const FespPresentationBasePage({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [FespText(text: title)],
        ),
        ...children,
      ],
    );
  }
}
