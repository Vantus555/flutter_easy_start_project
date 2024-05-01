import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_code.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_base_page.dart';

class FespPresentationAbout extends StatelessWidget {
  const FespPresentationAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const FespPresentationBasePage(
      title: "What is Flutter easy start project(FESP)?",
      children: [
        FespText(
          text:
              'This library provides a ready-made set of widgets that support special modification functions of standard widgets.',
        ),
      ],
    );
  }
}
