// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_checkbox_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FespCheckboxListBuilderDataCWProxy {
  FespCheckboxListBuilderData title(Widget title);

  FespCheckboxListBuilderData value(bool value);

  FespCheckboxListBuilderData onChanged(void Function(bool?)? onChanged);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespCheckboxListBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespCheckboxListBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespCheckboxListBuilderData call({
    Widget? title,
    bool? value,
    void Function(bool?)? onChanged,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespCheckboxListBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespCheckboxListBuilderData.copyWith.fieldName(...)`
class _$FespCheckboxListBuilderDataCWProxyImpl
    implements _$FespCheckboxListBuilderDataCWProxy {
  const _$FespCheckboxListBuilderDataCWProxyImpl(this._value);

  final FespCheckboxListBuilderData _value;

  @override
  FespCheckboxListBuilderData title(Widget title) => this(title: title);

  @override
  FespCheckboxListBuilderData value(bool value) => this(value: value);

  @override
  FespCheckboxListBuilderData onChanged(void Function(bool?)? onChanged) =>
      this(onChanged: onChanged);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespCheckboxListBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespCheckboxListBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespCheckboxListBuilderData call({
    Object? title = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? onChanged = const $CopyWithPlaceholder(),
  }) {
    return FespCheckboxListBuilderData(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as Widget,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as bool,
      onChanged: onChanged == const $CopyWithPlaceholder()
          ? _value.onChanged
          // ignore: cast_nullable_to_non_nullable
          : onChanged as void Function(bool?)?,
    );
  }
}

extension $FespCheckboxListBuilderDataCopyWith on FespCheckboxListBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespCheckboxListBuilderData.copyWith(...)` or like so:`instanceOfFespCheckboxListBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespCheckboxListBuilderDataCWProxy get copyWith =>
      _$FespCheckboxListBuilderDataCWProxyImpl(this);
}

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

extension on FespCheckboxList {
  CheckboxListTile _$fespBuilder1(
    FespCheckboxListBuilderData p0,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
          )
        : CheckboxListTile(
            title: p0.title,
            value: p0.value,
            onChanged: p0.onChanged,
          );
  }
}
