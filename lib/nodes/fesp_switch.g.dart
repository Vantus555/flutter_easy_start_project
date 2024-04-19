// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_switch.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespSwitchBuilderData {
  final bool value;
  final void Function(bool value)? onChanged;
  final void Function(bool value)? onFocusChange;

  const $FespSwitchBuilderData({
    this.value = false,
    this.onChanged,
    this.onFocusChange,
  });
  $FespSwitchBuilderData $copyWith({
    bool? value,
    void Function(bool value)? onFocusChange,
  }) {
    return $FespSwitchBuilderData(
      value: value ?? this.value,
      onFocusChange: onFocusChange ?? this.onFocusChange,
    );
  }
}

extension on FespSwitchData {
  Switch _$fespBuilder0(
    BuildContext p0,
    $FespSwitchBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Switch(
            value: p1.value,
            onChanged: p1.onChanged,
            onFocusChange: p1.onFocusChange,
          );
  }

  FespSwitchData $copyWith({
    $FespSwitchBuilderData? initData,
    Switch Function(BuildContext, $FespSwitchBuilderData)? fespBuilder0,
  }) {
    return FespSwitchData(
      initData: initData ?? this.initData,
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
    );
  }
}
