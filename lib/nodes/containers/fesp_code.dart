import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespCode extends StatelessWidget {
  final String text;
  const FespCode({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FespContainer(
      data: FespContainerData(
        padding: 10,
        fespBuilder0: (p0, p1) {
          return Container(
            width: p1.width,
            height: p1.height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
              ),
              color: FESP_ACTIVE_COLOR(p0),
            ),
            child: p1.child,
          );
        },
      ),
      child: FespText(text: text),
    );
  }
}
