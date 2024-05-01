import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_vertical_tab_container.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_about.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_container.dart';

class FespPresentationPage extends StatelessWidget {
  const FespPresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FespVerticalTabContainer(
      data: FespVerticalTabContainerData(
        titles: [
          'hello',
          'container',
        ],
        children: const [
          FespPresentationAbout(),
          FespPresentationContainer(),
        ],
      ),
    );
  }
}
