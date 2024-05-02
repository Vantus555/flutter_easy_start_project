import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_code.dart';
import 'package:flutter_easy_start_project/nodes/fesp_table.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_base_page.dart';

class FespPresentationContainer extends StatelessWidget {
  const FespPresentationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const FespPresentationBasePage(
      title: "FespContainer",
      children: [
        FespText(
          text: 'Example',
        ),
        FespCode(
          text: """
FespContainer(
  data: FespContainerData(
    fespBuilder0: (p0, p1) {
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
        // FespTable(
        //   width: 500,
        //   height: 500,
        //   items: [
        //     [
        //       Text('1'),
        //       Text('2'),
        //     ],
        //     [
        //       Text('3'),
        //       Text('4'),
        //     ]
        //   ],
        // ),
      ],
    );
  }
}
