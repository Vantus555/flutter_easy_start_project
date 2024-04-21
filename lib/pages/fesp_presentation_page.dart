import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_text.dart';

class FespPresentationPage extends StatelessWidget {
  const FespPresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FespText(
            alignment: Alignment.center,
            builder: () => const SelectableText(
              'Flutter easy start project!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
