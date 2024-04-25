// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_slider.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespSliderBuilderData {
  final int? divisions;
  final double min;
  final double max;
  final double value;
  final String label;
  final Function(double value)? onChanged;

  const $FespSliderBuilderData({
    this.divisions,
    this.min = 0,
    this.max = 1,
    required this.value,
    required this.label,
    this.onChanged,
  });
  $FespSliderBuilderData copyWith({
    int? divisions,
    double? min,
    double? max,
    double? value,
    String? label,
    Function(double value)? onChanged,
  }) {
    return $FespSliderBuilderData(
      divisions: divisions ?? this.divisions,
      min: min ?? this.min,
      max: max ?? this.max,
      value: value ?? this.value,
      label: label ?? this.label,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

class _$FespSlideData {
  final Slider Function(
    BuildContext p0,
    $FespSliderBuilderData p1,
  )? fespBuilder0;

  const _$FespSlideData({
    this.fespBuilder0,
  });
  Slider _$fespBuilder0(
    BuildContext p0,
    $FespSliderBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Slider(
            onChanged: p1.onChanged,
            label: p1.label,
            value: p1.value,
            max: p1.max,
            min: p1.min,
            divisions: p1.divisions,
          );
  }
}

extension on FespSlideData {
  FespSlideData copyWith({
    final Slider Function(
      BuildContext p0,
      $FespSliderBuilderData p1,
    )? fespBuilder0,
    int? divisions,
    double? min,
    double? max,
    double? value,
    dynamic Function(double)? onChanged,
  }) {
    return FespSlideData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      divisions: divisions ?? this.divisions,
      min: min ?? this.min,
      max: max ?? this.max,
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}
