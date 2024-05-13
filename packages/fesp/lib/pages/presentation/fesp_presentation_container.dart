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
    const gap = Size(2, 2);

    tableBuilder(item, x, y) {
      Color? color;
      if (y == 0 && x == 0) {
        color = FESP_ACTIVE_COLOR(context);
      } else if (y == 0 || x == 0) {
        color = FESP_TAB_BAR_COLOR(context);
      }
      return Container(
        color: color,
        child: Center(
          child: FespText(text: item),
        ),
      );
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
              gap: gap,
              rows: const [
                [
                  'USUAL',
                  'xs < 576',
                  'sm < 768',
                  'md < 992',
                  'lg < 1200',
                  'xl < 1600',
                  'xxl > 1600'
                ],
                ['FILL', '100%', '100%', '100%', '100%', '100%', '100%'],
                ['XXL', '100%', '100%', '100%', '100%', '100%', '1600'],
                ['XL', '100%', '100%', '100%', '100%', '1200', '1600'],
                ['LG', '100%', '100%', '100%', '992', '1200', '1600'],
                ['MD', '100%', '100%', '768', '992', '1200', '1600'],
                ['SM', '100%', '576', '768', '992', '1200', '1600'],
              ],
              builder: tableBuilder,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: FespTable(
            data: FespTableData(
              gap: gap,
              firstCell: 'FIXED',
              fromDict: {
                'FILL': {
                  'xs < 576': '100%',
                  'sm < 768': '100%',
                  'md < 992': '100%',
                  'lg < 1200': '100%',
                  'xl < 1600': '100%',
                  'xxl > 1600': '100%'
                },
                'XXL': {
                  'xs < 576': '100%',
                  'sm < 768': '100%',
                  'md < 992': '100%',
                  'lg < 1200': '100%',
                  'xl < 1600': '100%',
                  'xxl > 1600': '1600'
                },
                'XL': {
                  'xs < 576': '100%',
                  'sm < 768': '100%',
                  'md < 992': '100%',
                  'lg < 1200': '100%',
                  'xl < 1600': '1200',
                  'xxl > 1600': '1200'
                },
                'LG': {
                  'xs < 576': '100%',
                  'sm < 768': '100%',
                  'md < 992': '100%',
                  'lg < 1200': '992',
                  'xl < 1600': '992',
                  'xxl > 1600': '992'
                },
                'MD': {
                  'xs < 576': '100%',
                  'sm < 768': '100%',
                  'md < 992': '768',
                  'lg < 1200': '768',
                  'xl < 1600': '768',
                  'xxl > 1600': '768'
                },
                'SM': {
                  'xs < 576': '100%',
                  'sm < 768': '576',
                  'md < 992': '576',
                  'lg < 1200': '576',
                  'xl < 1600': '576',
                  'xxl > 1600': '576'
                },
              },
              builder: tableBuilder,
            ),
          ),
        ),
      ],
    );
  }
}
