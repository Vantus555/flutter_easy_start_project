// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_text_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FespTextFieldFocusBuilderDataCWProxy {
  FespTextFieldFocusBuilderData onFocusChange(
      dynamic Function(bool)? onFocusChange);

  FespTextFieldFocusBuilderData focusNodeData(
      FespTextFieldFocusNodeBuilderData focusNodeData);

  FespTextFieldFocusBuilderData childData(FespTextFieldBuilderData childData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldFocusBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldFocusBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldFocusBuilderData call({
    dynamic Function(bool)? onFocusChange,
    FespTextFieldFocusNodeBuilderData? focusNodeData,
    FespTextFieldBuilderData? childData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespTextFieldFocusBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespTextFieldFocusBuilderData.copyWith.fieldName(...)`
class _$FespTextFieldFocusBuilderDataCWProxyImpl
    implements _$FespTextFieldFocusBuilderDataCWProxy {
  const _$FespTextFieldFocusBuilderDataCWProxyImpl(this._value);

  final FespTextFieldFocusBuilderData _value;

  @override
  FespTextFieldFocusBuilderData onFocusChange(
          dynamic Function(bool)? onFocusChange) =>
      this(onFocusChange: onFocusChange);

  @override
  FespTextFieldFocusBuilderData focusNodeData(
          FespTextFieldFocusNodeBuilderData focusNodeData) =>
      this(focusNodeData: focusNodeData);

  @override
  FespTextFieldFocusBuilderData childData(FespTextFieldBuilderData childData) =>
      this(childData: childData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldFocusBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldFocusBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldFocusBuilderData call({
    Object? onFocusChange = const $CopyWithPlaceholder(),
    Object? focusNodeData = const $CopyWithPlaceholder(),
    Object? childData = const $CopyWithPlaceholder(),
  }) {
    return FespTextFieldFocusBuilderData(
      onFocusChange: onFocusChange == const $CopyWithPlaceholder()
          ? _value.onFocusChange
          // ignore: cast_nullable_to_non_nullable
          : onFocusChange as dynamic Function(bool)?,
      focusNodeData:
          focusNodeData == const $CopyWithPlaceholder() || focusNodeData == null
              ? _value.focusNodeData
              // ignore: cast_nullable_to_non_nullable
              : focusNodeData as FespTextFieldFocusNodeBuilderData,
      childData: childData == const $CopyWithPlaceholder() || childData == null
          ? _value.childData
          // ignore: cast_nullable_to_non_nullable
          : childData as FespTextFieldBuilderData,
    );
  }
}

extension $FespTextFieldFocusBuilderDataCopyWith
    on FespTextFieldFocusBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespTextFieldFocusBuilderData.copyWith(...)` or like so:`instanceOfFespTextFieldFocusBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespTextFieldFocusBuilderDataCWProxy get copyWith =>
      _$FespTextFieldFocusBuilderDataCWProxyImpl(this);
}

abstract class _$FespTextFieldFocusNodeBuilderDataCWProxy {
  FespTextFieldFocusNodeBuilderData canRequestFocus(bool canRequestFocus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldFocusNodeBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldFocusNodeBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldFocusNodeBuilderData call({
    bool? canRequestFocus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespTextFieldFocusNodeBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespTextFieldFocusNodeBuilderData.copyWith.fieldName(...)`
class _$FespTextFieldFocusNodeBuilderDataCWProxyImpl
    implements _$FespTextFieldFocusNodeBuilderDataCWProxy {
  const _$FespTextFieldFocusNodeBuilderDataCWProxyImpl(this._value);

  final FespTextFieldFocusNodeBuilderData _value;

  @override
  FespTextFieldFocusNodeBuilderData canRequestFocus(bool canRequestFocus) =>
      this(canRequestFocus: canRequestFocus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldFocusNodeBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldFocusNodeBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldFocusNodeBuilderData call({
    Object? canRequestFocus = const $CopyWithPlaceholder(),
  }) {
    return FespTextFieldFocusNodeBuilderData(
      canRequestFocus: canRequestFocus == const $CopyWithPlaceholder() ||
              canRequestFocus == null
          ? _value.canRequestFocus
          // ignore: cast_nullable_to_non_nullable
          : canRequestFocus as bool,
    );
  }
}

extension $FespTextFieldFocusNodeBuilderDataCopyWith
    on FespTextFieldFocusNodeBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespTextFieldFocusNodeBuilderData.copyWith(...)` or like so:`instanceOfFespTextFieldFocusNodeBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespTextFieldFocusNodeBuilderDataCWProxy get copyWith =>
      _$FespTextFieldFocusNodeBuilderDataCWProxyImpl(this);
}

abstract class _$FespTextFieldBuilderDataCWProxy {
  FespTextFieldBuilderData controller(TextEditingController controller);

  FespTextFieldBuilderData obscureText(bool obscureText);

  FespTextFieldBuilderData inputFormatters(
      List<TextInputFormatter>? inputFormatters);

  FespTextFieldBuilderData decoration(InputDecoration decoration);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldBuilderData call({
    TextEditingController? controller,
    bool? obscureText,
    List<TextInputFormatter>? inputFormatters,
    InputDecoration? decoration,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespTextFieldBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespTextFieldBuilderData.copyWith.fieldName(...)`
class _$FespTextFieldBuilderDataCWProxyImpl
    implements _$FespTextFieldBuilderDataCWProxy {
  const _$FespTextFieldBuilderDataCWProxyImpl(this._value);

  final FespTextFieldBuilderData _value;

  @override
  FespTextFieldBuilderData controller(TextEditingController controller) =>
      this(controller: controller);

  @override
  FespTextFieldBuilderData obscureText(bool obscureText) =>
      this(obscureText: obscureText);

  @override
  FespTextFieldBuilderData inputFormatters(
          List<TextInputFormatter>? inputFormatters) =>
      this(inputFormatters: inputFormatters);

  @override
  FespTextFieldBuilderData decoration(InputDecoration decoration) =>
      this(decoration: decoration);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldBuilderData call({
    Object? controller = const $CopyWithPlaceholder(),
    Object? obscureText = const $CopyWithPlaceholder(),
    Object? inputFormatters = const $CopyWithPlaceholder(),
    Object? decoration = const $CopyWithPlaceholder(),
  }) {
    return FespTextFieldBuilderData(
      controller:
          controller == const $CopyWithPlaceholder() || controller == null
              ? _value.controller
              // ignore: cast_nullable_to_non_nullable
              : controller as TextEditingController,
      obscureText:
          obscureText == const $CopyWithPlaceholder() || obscureText == null
              ? _value.obscureText
              // ignore: cast_nullable_to_non_nullable
              : obscureText as bool,
      inputFormatters: inputFormatters == const $CopyWithPlaceholder()
          ? _value.inputFormatters
          // ignore: cast_nullable_to_non_nullable
          : inputFormatters as List<TextInputFormatter>?,
      decoration:
          decoration == const $CopyWithPlaceholder() || decoration == null
              ? _value.decoration
              // ignore: cast_nullable_to_non_nullable
              : decoration as InputDecoration,
    );
  }
}

extension $FespTextFieldBuilderDataCopyWith on FespTextFieldBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespTextFieldBuilderData.copyWith(...)` or like so:`instanceOfFespTextFieldBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespTextFieldBuilderDataCWProxy get copyWith =>
      _$FespTextFieldBuilderDataCWProxyImpl(this);
}

abstract class _$FespTextFieldDataCWProxy {
  FespTextFieldData labelText(String labelText);

  FespTextFieldData initialValue(String initialValue);

  FespTextFieldData onFocusChange(
      dynamic Function(bool, String)? onFocusChange);

  FespTextFieldData fespBuilder1(
      Focus Function(BuildContext, FespTextFieldFocusBuilderData)?
          fespBuilder1);

  FespTextFieldData fespBuilder2(
      FocusNode Function(BuildContext, FespTextFieldFocusNodeBuilderData)?
          fespBuilder2);

  FespTextFieldData fespBuilder3(
      TextFormField Function(BuildContext, FespTextFieldBuilderData)?
          fespBuilder3);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldData call({
    String? labelText,
    String? initialValue,
    dynamic Function(bool, String)? onFocusChange,
    Focus Function(BuildContext, FespTextFieldFocusBuilderData)? fespBuilder1,
    FocusNode Function(BuildContext, FespTextFieldFocusNodeBuilderData)?
        fespBuilder2,
    TextFormField Function(BuildContext, FespTextFieldBuilderData)?
        fespBuilder3,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespTextFieldData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespTextFieldData.copyWith.fieldName(...)`
class _$FespTextFieldDataCWProxyImpl implements _$FespTextFieldDataCWProxy {
  const _$FespTextFieldDataCWProxyImpl(this._value);

  final FespTextFieldData _value;

  @override
  FespTextFieldData labelText(String labelText) => this(labelText: labelText);

  @override
  FespTextFieldData initialValue(String initialValue) =>
      this(initialValue: initialValue);

  @override
  FespTextFieldData onFocusChange(
          dynamic Function(bool, String)? onFocusChange) =>
      this(onFocusChange: onFocusChange);

  @override
  FespTextFieldData fespBuilder1(
          Focus Function(BuildContext, FespTextFieldFocusBuilderData)?
              fespBuilder1) =>
      this(fespBuilder1: fespBuilder1);

  @override
  FespTextFieldData fespBuilder2(
          FocusNode Function(BuildContext, FespTextFieldFocusNodeBuilderData)?
              fespBuilder2) =>
      this(fespBuilder2: fespBuilder2);

  @override
  FespTextFieldData fespBuilder3(
          TextFormField Function(BuildContext, FespTextFieldBuilderData)?
              fespBuilder3) =>
      this(fespBuilder3: fespBuilder3);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespTextFieldData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespTextFieldData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespTextFieldData call({
    Object? labelText = const $CopyWithPlaceholder(),
    Object? initialValue = const $CopyWithPlaceholder(),
    Object? onFocusChange = const $CopyWithPlaceholder(),
    Object? fespBuilder1 = const $CopyWithPlaceholder(),
    Object? fespBuilder2 = const $CopyWithPlaceholder(),
    Object? fespBuilder3 = const $CopyWithPlaceholder(),
  }) {
    return FespTextFieldData(
      labelText: labelText == const $CopyWithPlaceholder() || labelText == null
          ? _value.labelText
          // ignore: cast_nullable_to_non_nullable
          : labelText as String,
      initialValue:
          initialValue == const $CopyWithPlaceholder() || initialValue == null
              ? _value.initialValue
              // ignore: cast_nullable_to_non_nullable
              : initialValue as String,
      onFocusChange: onFocusChange == const $CopyWithPlaceholder()
          ? _value.onFocusChange
          // ignore: cast_nullable_to_non_nullable
          : onFocusChange as dynamic Function(bool, String)?,
      fespBuilder1: fespBuilder1 == const $CopyWithPlaceholder()
          ? _value.fespBuilder1
          // ignore: cast_nullable_to_non_nullable
          : fespBuilder1 as Focus Function(
              BuildContext, FespTextFieldFocusBuilderData)?,
      fespBuilder2: fespBuilder2 == const $CopyWithPlaceholder()
          ? _value.fespBuilder2
          // ignore: cast_nullable_to_non_nullable
          : fespBuilder2 as FocusNode Function(
              BuildContext, FespTextFieldFocusNodeBuilderData)?,
      fespBuilder3: fespBuilder3 == const $CopyWithPlaceholder()
          ? _value.fespBuilder3
          // ignore: cast_nullable_to_non_nullable
          : fespBuilder3 as TextFormField Function(
              BuildContext, FespTextFieldBuilderData)?,
    );
  }
}

extension $FespTextFieldDataCopyWith on FespTextFieldData {
  /// Returns a callable class that can be used as follows: `instanceOfFespTextFieldData.copyWith(...)` or like so:`instanceOfFespTextFieldData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespTextFieldDataCWProxy get copyWith =>
      _$FespTextFieldDataCWProxyImpl(this);
}

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

extension on FespTextFieldData {
  Focus _$fespBuilder1(
    BuildContext p0,
    FespTextFieldFocusBuilderData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : Focus(
            onFocusChange: p1.onFocusChange,
            focusNode: _$fespBuilder2(p0, p1.focusNodeData),
            child: _$fespBuilder3(p0, p1.childData),
          );
  }

  FocusNode _$fespBuilder2(
    BuildContext p0,
    FespTextFieldFocusNodeBuilderData p1,
  ) {
    return fespBuilder2 != null
        ? fespBuilder2!(
            p0,
            p1,
          )
        : FocusNode(
            canRequestFocus: p1.canRequestFocus,
          );
  }

  TextFormField _$fespBuilder3(
    BuildContext p0,
    FespTextFieldBuilderData p1,
  ) {
    return fespBuilder3 != null
        ? fespBuilder3!(
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
}
