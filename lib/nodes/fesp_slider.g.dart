// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_slider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FespSliderBuilderDataCWProxy {
  FespSliderBuilderData value(double value);

  FespSliderBuilderData label(String label);

  FespSliderBuilderData onChanged(dynamic Function(double)? onChanged);

  FespSliderBuilderData min(double min);

  FespSliderBuilderData max(double max);

  FespSliderBuilderData divisions(int? divisions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespSliderBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespSliderBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespSliderBuilderData call({
    double? value,
    String? label,
    dynamic Function(double)? onChanged,
    double? min,
    double? max,
    int? divisions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFespSliderBuilderData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFespSliderBuilderData.copyWith.fieldName(...)`
class _$FespSliderBuilderDataCWProxyImpl
    implements _$FespSliderBuilderDataCWProxy {
  const _$FespSliderBuilderDataCWProxyImpl(this._value);

  final FespSliderBuilderData _value;

  @override
  FespSliderBuilderData value(double value) => this(value: value);

  @override
  FespSliderBuilderData label(String label) => this(label: label);

  @override
  FespSliderBuilderData onChanged(dynamic Function(double)? onChanged) =>
      this(onChanged: onChanged);

  @override
  FespSliderBuilderData min(double min) => this(min: min);

  @override
  FespSliderBuilderData max(double max) => this(max: max);

  @override
  FespSliderBuilderData divisions(int? divisions) => this(divisions: divisions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FespSliderBuilderData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FespSliderBuilderData(...).copyWith(id: 12, name: "My name")
  /// ````
  FespSliderBuilderData call({
    Object? value = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? onChanged = const $CopyWithPlaceholder(),
    Object? min = const $CopyWithPlaceholder(),
    Object? max = const $CopyWithPlaceholder(),
    Object? divisions = const $CopyWithPlaceholder(),
  }) {
    return FespSliderBuilderData(
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as double,
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
      onChanged: onChanged == const $CopyWithPlaceholder()
          ? _value.onChanged
          // ignore: cast_nullable_to_non_nullable
          : onChanged as dynamic Function(double)?,
      min: min == const $CopyWithPlaceholder() || min == null
          ? _value.min
          // ignore: cast_nullable_to_non_nullable
          : min as double,
      max: max == const $CopyWithPlaceholder() || max == null
          ? _value.max
          // ignore: cast_nullable_to_non_nullable
          : max as double,
      divisions: divisions == const $CopyWithPlaceholder()
          ? _value.divisions
          // ignore: cast_nullable_to_non_nullable
          : divisions as int?,
    );
  }
}

extension $FespSliderBuilderDataCopyWith on FespSliderBuilderData {
  /// Returns a callable class that can be used as follows: `instanceOfFespSliderBuilderData.copyWith(...)` or like so:`instanceOfFespSliderBuilderData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FespSliderBuilderDataCWProxy get copyWith =>
      _$FespSliderBuilderDataCWProxyImpl(this);
}

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

extension on FespSlideData {
  Slider _$fespBuilder1(
    BuildContext p0,
    FespSliderBuilderData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : Slider(
            divisions: p1.divisions,
            min: p1.min,
            max: p1.max,
            value: p1.value,
            label: p1.label,
            onChanged: p1.onChanged,
          );
  }
}
