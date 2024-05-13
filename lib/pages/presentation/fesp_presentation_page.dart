import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_vertical_tab_container.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_about.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_container.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_quickstart.dart';

class FespPresentationPage extends StatelessWidget {
  const FespPresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FespVerticalTabContainer(
      data: FespVerticalTabContainerData(
        titles: [
          'quick start',
          'about',
          'container',
        ],
        children: const [
          FespPresentationQuickStart(),
          FespPresentationAbout(),
          FespPresentationContainer(),
        ],
      ),
    );
  }
}
