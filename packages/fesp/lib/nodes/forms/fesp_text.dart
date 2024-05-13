import 'package:flutter/material.dart';
import 'package:fesp_node_builders/fesp_node_classes.dart';
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
  final double padding;

  const FespTextData({
    this.isSelectable = true,
    this.padding = 5,
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
    Widget child;
    if (data.isSelectable) {
      child = data._$fespBuilder1(
        context,
        $FespSelectableTextBuilderData(text: text),
      );
    } else {
      child = data._$fespBuilder0(
        context,
        $FespTextBuilderData(text: text),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: data.padding,
        bottom: data.padding,
      ),
      child: child,
    );
  }
}
