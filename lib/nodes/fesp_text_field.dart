import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_text_field.g.dart';

final fespPositiveNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'\d*\.?\d*'));
final fespNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*\.?\d*'));

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespTextFieldFocusBuilderData',
      argsList: [
        'BuildContext',
        '\$FespTextFieldFocusBuilderData',
      ],
      returnType: 'Focus',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Function(bool)?',
          name: 'onFocusChange',
        ),
        FespNodeBuilderClassField(
          type: '\$FespTextFieldFocusNodeBuilderData',
          name: 'focusNode',
        ),
        FespNodeBuilderClassField(
          type: '\$FespTextFieldBuilderData',
          name: 'child',
        )
      ],
      customFields: {
        'focusNode': '_\$fespBuilder1(p0, p1.focusNode)',
        'child': '_\$fespBuilder2(p0, p1.child)',
      },
    ),
    FespNodeBuilderField(
      className: 'FespTextFieldFocusNodeBuilderData',
      argsList: [
        'BuildContext',
        '\$FespTextFieldFocusNodeBuilderData',
      ],
      returnType: 'FocusNode',
      classFields: [
        FespNodeBuilderClassField(type: 'bool', name: 'canRequestFocus')
      ],
    ),
    FespNodeBuilderField(
      className: 'FespTextFieldBuilderData',
      argsList: [
        'BuildContext',
        '\$FespTextFieldBuilderData',
      ],
      returnType: 'TextFormField',
      classFields: [
        FespNodeBuilderClassField(
          type: 'TextEditingController',
          name: 'controller',
        ),
        FespNodeBuilderClassField(
          type: 'bool',
          name: 'obscureText',
        ),
        FespNodeBuilderClassField(
          type: 'List<TextInputFormatter>?',
          name: 'inputFormatters',
        ),
        FespNodeBuilderClassField(
          type: 'InputDecoration',
          name: 'decoration',
        ),
      ],
    )
  ],
  invalidTypes: [
    '\$FespTextFieldFocusBuilderData',
    '\$FespTextFieldFocusNodeBuilderData',
    '\$FespTextFieldBuilderData',
  ],
)
class FespTextFieldData extends _$FespTextFieldData {
  final String labelText;
  final String initialValue;
  final void Function(bool isFocus, String value)? onFocusChange;

  const FespTextFieldData({
    this.labelText = '',
    this.initialValue = '',
    this.onFocusChange,
    super.fespBuilder0,
    super.fespBuilder1,
    super.fespBuilder2,
  });
}

class FespTextField extends StatelessWidget {
  final FespTextFieldData data;

  const FespTextField({
    super.key,
    this.data = const FespTextFieldData(),
  });

  factory FespTextField.positiveNumber({
    Key? key,
    final FespTextFieldData data = const FespTextFieldData(),
  }) {
    final newData = data.$copyWith(
      fespBuilder2: (context, newData) {
        return data._$fespBuilder2(
          context,
          $FespTextFieldBuilderData(
            controller: newData.controller,
            obscureText: false,
            inputFormatters: [fespPositiveNumberFormat],
            decoration: newData.decoration,
          ),
        );
      },
    );

    return FespTextField(
      key: key,
      data: newData,
    );
  }

  factory FespTextField.number({
    Key? key,
    final FespTextFieldData data = const FespTextFieldData(),
  }) {
    final newData = data.$copyWith(
      fespBuilder2: (context, newData) {
        return data._$fespBuilder2(
          context,
          $FespTextFieldBuilderData(
            controller: newData.controller,
            obscureText: false,
            inputFormatters: [fespNumberFormat],
            decoration: newData.decoration,
          ),
        );
      },
    );

    return FespTextField(
      key: key,
      data: newData,
    );
  }

  factory FespTextField.password({
    Key? key,
    final FespTextFieldData data = const FespTextFieldData(),
  }) {
    final newData = data.$copyWith(
      fespBuilder2: (context, newData) {
        return data._$fespBuilder2(
          context,
          $FespTextFieldBuilderData(
            controller: newData.controller,
            obscureText: true,
            inputFormatters: [],
            decoration: newData.decoration,
          ),
        );
      },
    );

    return FespTextField(
      key: key,
      data: newData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: data.initialValue);

    focusChnage(value) => data.onFocusChange != null
        ? data.onFocusChange!(value, controller.text)
        : null;

    return data._$fespBuilder0(
      context,
      $FespTextFieldFocusBuilderData(
        onFocusChange: focusChnage,
        focusNode: const $FespTextFieldFocusNodeBuilderData(
          canRequestFocus: false,
        ),
        child: $FespTextFieldBuilderData(
          controller: controller,
          obscureText: false,
          inputFormatters: [],
          decoration: InputDecoration(
            labelText: data.labelText,
            border: FESP_TEXT_INPUT_BORDER,
            contentPadding: FESP_TEXT_INPUT_CONTENT_PADDING,
          ),
        ),
      ),
    );
  }
}
