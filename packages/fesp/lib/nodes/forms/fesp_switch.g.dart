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
  // ignore: unused_element
  $FespSwitchBuilderData copyWith({
    bool? value,
    void Function(bool value)? onChanged,
    void Function(bool value)? onFocusChange,
  }) {
    return $FespSwitchBuilderData(
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      onFocusChange: onFocusChange ?? this.onFocusChange,
    );
  }
}

class _$FespSwitchData {
  final Switch Function(
    BuildContext p0,
    $FespSwitchBuilderData p1,
  )? fespBuilder0;

  const _$FespSwitchData({
    this.fespBuilder0,
  });
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
            onFocusChange: p1.onFocusChange,
            onChanged: p1.onChanged,
            value: p1.value,
          );
  }
}

extension on FespSwitchData {
  // ignore: unused_element
  FespSwitchData copyWith({
    final Switch Function(
      BuildContext p0,
      $FespSwitchBuilderData p1,
    )? fespBuilder0,
    $FespSwitchBuilderData? initData,
  }) {
    return FespSwitchData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      initData: initData ?? this.initData,
    );
  }
}
