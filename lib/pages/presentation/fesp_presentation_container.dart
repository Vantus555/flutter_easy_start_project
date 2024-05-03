import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_code.dart';
import 'package:flutter_easy_start_project/nodes/fesp_table.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_base_page.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespPresentationContainer extends StatelessWidget {
  const FespPresentationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    tableBuilder(item, x, y) {
      final child = FespText(text: item);
      if (x == 0 && y == 0) {
        return ColoredBox(
          color: FESP_ACTIVE_COLOR(context),
          child: child,
        );
      }
      return child;
    }

    return FespPresentationBasePage(
      title: "FespContainer",
      children: [
        const FespText(
          text: 'Example',
        ),
        const FespCode(
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
        const FespText(
          text: 'FespContainerSize and FespContainerType',
        ),
        Center(
          child: FespTable(
            data: FespTableData(
              firstCell: 'USUAL',
              horizontalHeaders: const [
                'xs < 576',
                'sm < 768',
                'md < 992',
                'lg < 1200',
                'xl < 1600',
                'xxl > 1600'
              ],
              verticalHeaders: const ['FILL', 'XXL', 'XL', 'LG', 'MD', 'SM'],
              items: const [
                ['100%', '100%', '100%', '100%', '100%', '100%'],
                ['100%', '100%', '100%', '100%', '100%', '1600'],
                ['100%', '100%', '100%', '100%', '1200', '1600'],
                ['100%', '100%', '100%', '992', '1200', '1600'],
                ['100%', '100%', '768', '992', '1200', '1600'],
                ['100%', '576', '768', '992', '1200', '1600'],
              ],
              builder: tableBuilder,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: FespTable(
            data: FespTableData(
              firstCell: 'FIXED',
              horizontalHeaders: const [
                'xs < 576',
                'sm < 768',
                'md < 992',
                'lg < 1200',
                'xl < 1600',
                'xxl > 1600'
              ],
              verticalHeaders: const ['FILL', 'XXL', 'XL', 'LG', 'MD', 'SM'],
              items: const [
                ['100%', '100%', '100%', '100%', '100%', '100%'],
                ['100%', '100%', '100%', '100%', '100%', '1600'],
                ['100%', '100%', '100%', '100%', '1200', '1600'],
                ['100%', '100%', '100%', '992', '1200', '1600'],
                ['100%', '100%', '768', '992', '1200', '1600'],
                ['100%', '576', '768', '992', '1200', '1600'],
              ],
              builder: tableBuilder,
            ),
          ),
        ),
      ],
    );
  }
}
