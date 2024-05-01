import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
part 'fesp_text.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespTextBuilderData',
      returnType: 'Text',
      classFields: [
        FespNodeBuilderClassField(
          type: 'String',
          name: 'text',
          position: 0,
        ),
      ],
    ),
    FespNodeBuilderField(
      className: 'FespSelectableTextBuilderData',
      returnType: 'SelectableText',
      classFields: [
        FespNodeBuilderClassField(
          type: 'String',
          name: 'text',
          position: 0,
        ),
      ],
    ),
  ],
)
class FespTextData extends _$FespTextData {
  final bool isSelectable;

  const FespTextData({
    this.isSelectable = true,
    super.fespBuilder0,
    super.fespBuilder1,
  });
}

class FespText extends StatelessWidget {
  final String text;
  final FespTextData data;

  const FespText({
    super.key,
    required this.text,
    this.data = const FespTextData(),
  });

  @override
  Widget build(BuildContext context) {
    if (data.isSelectable) {
      return data._$fespBuilder1(
        context,
        $FespSelectableTextBuilderData(text: text),
      );
    }
    return data._$fespBuilder0(
      context,
      $FespTextBuilderData(text: text),
    );
  }
}
