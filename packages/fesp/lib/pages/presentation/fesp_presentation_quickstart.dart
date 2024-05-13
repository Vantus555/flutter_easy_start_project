import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_code.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_base_page.dart';

class FespPresentationQuickStart extends StatelessWidget {
  const FespPresentationQuickStart({super.key});

  @override
  Widget build(BuildContext context) {
    return const FespPresentationBasePage(
      title: "easy start project(FESP)?",
      children: [
        FespText(text: 'Use this package as a library'),
        FespCode(text: """
flutter pub add flutter_easy_start_project"""),
      ],
    );
  }
}
