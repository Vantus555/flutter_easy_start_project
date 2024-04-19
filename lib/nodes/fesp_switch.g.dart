// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_switch.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FespSwitchBuilderDataCWProxy {
  FespSwitchBuilderData value(bool value);

  FespSwitchBuilderData onChanged(void Function(bool)? onChanged);

  FespSwitchBuilderData onFocusChange(void Function(bool)? onFocusChange);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespSwitchBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespSwitchBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespSwitchBuilderData call({
    bool? value,
    void Function(bool)? onChanged,
    void Function(bool)? onFocusChange,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespSwitchBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespSwitchBuilderData.copyWith.fieldName(...)`
class _$FespSwitchBuilderDataCWProxyImpl
    implements _$FespSwitchBuilderDataCWProxy {
  const _$FespSwitchBuilderDataCWProxyImpl(this._value);

  final FespSwitchBuilderData _value;

  @override
  FespSwitchBuilderData value(bool value) => this(value: value);

  @override
  FespSwitchBuilderData onChanged(void Function(bool)? onChanged) =>
      this(onChanged: onChanged);

  @override
  FespSwitchBuilderData onFocusChange(void Function(bool)? onFocusChange) =>
      this(onFocusChange: onFocusChange);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespSwitchBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespSwitchBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespSwitchBuilderData call({
    Object? value = const $CopyWithPlaceholder(),
    Object? onChanged = const $CopyWithPlaceholder(),
    Object? onFocusChange = const $CopyWithPlaceholder(),
  }) {
    return FespSwitchBuilderData(
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as bool,
      onChanged: onChanged == const $CopyWithPlaceholder()
          ? _value.onChanged
          // ignore: cast_nullable_to_non_nullable
          : onChanged as void Function(bool)?,
      onFocusChange: onFocusChange == const $CopyWithPlaceholder()
          ? _value.onFocusChange
          // ignore: cast_nullable_to_non_nullable
          : onFocusChange as void Function(bool)?,
    );
  }
}

extension $FespSwitchBuilderDataCopyWith on FespSwitchBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespSwitchBuilderData.copyWith(...)` or like so:`instanceOfFespSwitchBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespSwitchBuilderDataCWProxy get copyWith =>
      _$FespSwitchBuilderDataCWProxyImpl(this);
}

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

extension on FespSwitchData {
  Switch _$fespBuilder1(
    FespSwitchBuilderData p0,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
          )
        : Switch(
            value: p0.value,
            onChanged: p0.onChanged,
            onFocusChange: p0.onFocusChange,
          );
  }
}
