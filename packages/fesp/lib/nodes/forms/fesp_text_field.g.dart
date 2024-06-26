// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_text_field.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespTextFieldFocusBuilderData {
  final Function(bool)? onFocusChange;
  final $FespTextFieldFocusNodeBuilderData focusNode;
  final $FespTextFieldBuilderData child;

  const $FespTextFieldFocusBuilderData({
    this.onFocusChange,
    required this.focusNode,
    required this.child,
  });
  // ignore: unused_element
  $FespTextFieldFocusBuilderData copyWith({
    Function(bool)? onFocusChange,
    $FespTextFieldFocusNodeBuilderData? focusNode,
    $FespTextFieldBuilderData? child,
  }) {
    return $FespTextFieldFocusBuilderData(
      onFocusChange: onFocusChange ?? this.onFocusChange,
      focusNode: focusNode ?? this.focusNode,
      child: child ?? this.child,
    );
  }
}

class $FespTextFieldFocusNodeBuilderData {
  final bool canRequestFocus;

  const $FespTextFieldFocusNodeBuilderData({
    required this.canRequestFocus,
  });
  // ignore: unused_element
  $FespTextFieldFocusNodeBuilderData copyWith({
    bool? canRequestFocus,
  }) {
    return $FespTextFieldFocusNodeBuilderData(
      canRequestFocus: canRequestFocus ?? this.canRequestFocus,
    );
  }
}

class $FespTextFieldBuilderData {
  final TextEditingController controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration decoration;

  const $FespTextFieldBuilderData({
    required this.controller,
    required this.obscureText,
    this.inputFormatters,
    required this.decoration,
  });
  // ignore: unused_element
  $FespTextFieldBuilderData copyWith({
    TextEditingController? controller,
    bool? obscureText,
    List<TextInputFormatter>? inputFormatters,
    InputDecoration? decoration,
  }) {
    return $FespTextFieldBuilderData(
      controller: controller ?? this.controller,
      obscureText: obscureText ?? this.obscureText,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      decoration: decoration ?? this.decoration,
    );
  }
}

class _$FespTextFieldData {
  final Focus Function(
    BuildContext p0,
    $FespTextFieldFocusBuilderData p1,
  )? fespBuilder0;
  final FocusNode Function(
    BuildContext p0,
    $FespTextFieldFocusNodeBuilderData p1,
  )? fespBuilder1;
  final TextFormField Function(
    BuildContext p0,
    $FespTextFieldBuilderData p1,
  )? fespBuilder2;

  const _$FespTextFieldData({
    this.fespBuilder0,
    this.fespBuilder1,
    this.fespBuilder2,
  });
  Focus _$fespBuilder0(
    BuildContext p0,
    $FespTextFieldFocusBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Focus(
            onFocusChange: p1.onFocusChange,
            focusNode: _$fespBuilder1(p0, p1.focusNode),
            child: _$fespBuilder2(p0, p1.child),
          );
  }

  FocusNode _$fespBuilder1(
    BuildContext p0,
    $FespTextFieldFocusNodeBuilderData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : FocusNode(
            canRequestFocus: p1.canRequestFocus,
          );
  }

  TextFormField _$fespBuilder2(
    BuildContext p0,
    $FespTextFieldBuilderData p1,
  ) {
    return fespBuilder2 != null
        ? fespBuilder2!(
            p0,
            p1,
          )
        : TextFormField(
            decoration: p1.decoration,
            inputFormatters: p1.inputFormatters,
            obscureText: p1.obscureText,
            controller: p1.controller,
          );
  }
}

extension on FespTextFieldData {
  // ignore: unused_element
  FespTextFieldData copyWith({
    final Focus Function(
      BuildContext p0,
      $FespTextFieldFocusBuilderData p1,
    )? fespBuilder0,
    final FocusNode Function(
      BuildContext p0,
      $FespTextFieldFocusNodeBuilderData p1,
    )? fespBuilder1,
    final TextFormField Function(
      BuildContext p0,
      $FespTextFieldBuilderData p1,
    )? fespBuilder2,
    String? labelText,
    String? initialValue,
    void Function(bool, String)? onFocusChange,
  }) {
    return FespTextFieldData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      fespBuilder1: fespBuilder1 ?? this.fespBuilder1,
      fespBuilder2: fespBuilder2 ?? this.fespBuilder2,
      labelText: labelText ?? this.labelText,
      initialValue: initialValue ?? this.initialValue,
      onFocusChange: onFocusChange ?? this.onFocusChange,
    );
  }
}
