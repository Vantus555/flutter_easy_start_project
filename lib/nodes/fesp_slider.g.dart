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
  $FespSliderBuilderData $copyWith({
    int? divisions,
    double? value,
    String? label,
    Function(double value)? onChanged,
  }) {
    return $FespSliderBuilderData(
      divisions: divisions ?? this.divisions,
      value: value ?? this.value,
      label: label ?? this.label,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

extension on FespSlideData {
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
            divisions: p1.divisions,
            min: p1.min,
            max: p1.max,
            value: p1.value,
            label: p1.label,
            onChanged: p1.onChanged,
          );
  }

  FespSlideData $copyWith({
    int? divisions,
    double? value,
    dynamic Function(double)? onChanged,
    Slider Function(BuildContext, $FespSliderBuilderData)? fespBuilder0,
  }) {
    return FespSlideData(
      divisions: divisions ?? this.divisions,
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
    );
  }
}
