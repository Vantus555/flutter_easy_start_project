import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_builders.dart';

part 'fesp_text_field.g.dart';

final fespPositiveNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'\d*\.?\d*'));
final fespNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*\.?\d*'));

@CopyWith()
class FespTextFieldFocusBuilderData {
  final Function(bool)? onFocusChange;
  final FespTextFieldFocusNodeBuilderData focusNodeData;
  final FespTextFieldBuilderData childData;

  const FespTextFieldFocusBuilderData({
    required this.onFocusChange,
    required this.focusNodeData,
    required this.childData,
  });
}

@CopyWith()
class FespTextFieldFocusNodeBuilderData {
  final bool canRequestFocus;

  const FespTextFieldFocusNodeBuilderData({
    required this.canRequestFocus,
  });
}

@CopyWith()
class FespTextFieldBuilderData {
  final TextEditingController controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration decoration;

  const FespTextFieldBuilderData({
    required this.controller,
    required this.obscureText,
    required this.inputFormatters,
    required this.decoration,
  });
}

@CopyWith()
@FespNodeBuildersA()
class FespTextFieldData {
  final String labelText;
  final String initialValue;
  final Function(bool isFocus, String value)? onFocusChange;

  @FespNodeBuilderFieldA(
    classFields: [
      'onFocusChange',
    ],
    customFields: [
      'focusNode: _\$fespBuilder2(p0, p1.focusNodeData)',
      'child: _\$fespBuilder3(p0, p1.childData)',
    ],
  )
  final Focus Function(
    BuildContext context,
    FespTextFieldFocusBuilderData data,
  )? fespBuilder1;

  //
  @FespNodeBuilderFieldA(
    classFields: [
      'canRequestFocus',
    ],
  )
  final FocusNode Function(
    BuildContext context,
    FespTextFieldFocusNodeBuilderData data,
  )? fespBuilder2;

  //
  @FespNodeBuilderFieldA(
    classFields: [
      'controller',
      'obscureText',
      'inputFormatters',
      'decoration',
    ],
  )
  final TextFormField Function(
    BuildContext context,
    FespTextFieldBuilderData data,
  )? fespBuilder3;

  const FespTextFieldData({
    this.labelText = '',
    this.initialValue = '',
    this.onFocusChange,
    this.fespBuilder1,
    this.fespBuilder2,
    this.fespBuilder3,
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
    final newData = data.copyWith.fespBuilder3(
      (context, newData) {
        return data._$fespBuilder3(
          context,
          FespTextFieldBuilderData(
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
    final newData = data.copyWith.fespBuilder3(
      (context, newData) {
        return data._$fespBuilder3(
          context,
          FespTextFieldBuilderData(
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
    final newData = data.copyWith.fespBuilder3(
      (context, newData) {
        return data._$fespBuilder3(
          context,
          FespTextFieldBuilderData(
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

    return data._$fespBuilder1(
      context,
      FespTextFieldFocusBuilderData(
        onFocusChange: focusChnage,
        focusNodeData: const FespTextFieldFocusNodeBuilderData(
          canRequestFocus: false,
        ),
        childData: FespTextFieldBuilderData(
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
