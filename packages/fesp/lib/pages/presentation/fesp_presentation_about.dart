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
              'This library provides the ability to quickly create projects using the same style of the entire project. FESP provides a ready-made set of widgets that support special modification functions of standard widgets.',
        ),
        FespText(
          text:
              'Each widget in FESP can contain arguments-functions that provide the ability to modify standard widgets while maintaining the application style. Such arguments are called:',
        ),
        FespCode(
          text: """
fespBuilder0
fespBuilder1
fespBuilder2""",
        ),
        FespText(
          text:
              'There can be any number of such functions (they are generated automatically) and usually pass 2 arguments: context and structure (automatically generated)',
        ),
        FespText(
          text:
              'This structure contains fields that FESP modifies in standard widgets',
        ),
        FespText(text: 'Example'),
        FespCode(
          text: """
FespContainer(
  data: FespContainerData(
    fespBuilder0: (context, p1) {
      return Container(
        color: Colors.black,
        width: p1.width,
        height: p1.height,
        child: p1.child,
      );
    },
  ),
  child: const Text('Hello!'),
);""",
        ),
        FespText(
          text:
              'In this example, the FaspContainer widget has one fespBuilder0 to which the context and structure with the data that FESP modifies for the stage widget are passed',
        ),
        FespText(
          text:
              'This widget modification system allows you to make changes to FESP widgets without affecting their functionality and general style',
        ),
      ],
    );
  }
}
