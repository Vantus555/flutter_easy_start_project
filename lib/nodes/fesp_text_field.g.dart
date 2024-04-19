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
  $FespTextFieldFocusBuilderData $copyWith({
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
  $FespTextFieldFocusNodeBuilderData $copyWith({
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
  $FespTextFieldBuilderData $copyWith({
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

extension on FespTextFieldData {
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
            focusNode: _$fespBuilder1(p0, p1.focusNode),
            child: _$fespBuilder2(p0, p1.child),
            onFocusChange: p1.onFocusChange,
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
            controller: p1.controller,
            obscureText: p1.obscureText,
            inputFormatters: p1.inputFormatters,
            decoration: p1.decoration,
          );
  }

  FespTextFieldData $copyWith({
    String? initialValue,
    dynamic Function(bool, String)? onFocusChange,
    Focus Function(BuildContext, $FespTextFieldFocusBuilderData)? fespBuilder0,
    FocusNode Function(BuildContext, $FespTextFieldFocusNodeBuilderData)?
        fespBuilder1,
    TextFormField Function(BuildContext, $FespTextFieldBuilderData)?
        fespBuilder2,
  }) {
    return FespTextFieldData(
      initialValue: initialValue ?? this.initialValue,
      onFocusChange: onFocusChange ?? this.onFocusChange,
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      fespBuilder1: fespBuilder1 ?? this.fespBuilder1,
      fespBuilder2: fespBuilder2 ?? this.fespBuilder2,
    );
  }
}
