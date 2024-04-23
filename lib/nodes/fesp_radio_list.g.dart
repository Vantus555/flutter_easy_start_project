// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_radio_list.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespRadioListBuilderData {
  final Object value;
  final Object? groupValue;
  final void Function(Object?)? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final Color? selectedTileColor;
  final bool selected;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;

  const $FespRadioListBuilderData({
    required this.value,
    this.groupValue,
    this.onChanged,
    this.title,
    this.subtitle,
    this.selectedTileColor,
    required this.selected,
    this.visualDensity,
    this.shape,
  });
  $FespRadioListBuilderData copyWith({
    Object? value,
    Object? groupValue,
    void Function(Object?)? onChanged,
    Widget? title,
    Widget? subtitle,
    Color? selectedTileColor,
    bool? selected,
    VisualDensity? visualDensity,
    ShapeBorder? shape,
  }) {
    return $FespRadioListBuilderData(
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      selectedTileColor: selectedTileColor ?? this.selectedTileColor,
      selected: selected ?? this.selected,
      visualDensity: visualDensity ?? this.visualDensity,
      shape: shape ?? this.shape,
    );
  }
}

class _$FespRadioListBuilderData {
  final RadioListTile Function(
    BuildContext p0,
    $FespRadioListBuilderData p1,
  )? fespBuilder0;

  const _$FespRadioListBuilderData({
    this.fespBuilder0,
  });
  RadioListTile _$fespBuilder0(
    BuildContext p0,
    $FespRadioListBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : RadioListTile(
            shape: p1.shape,
            visualDensity: p1.visualDensity,
            selected: p1.selected,
            selectedTileColor: p1.selectedTileColor,
            subtitle: p1.subtitle,
            title: p1.title,
            onChanged: p1.onChanged,
            groupValue: p1.groupValue,
            value: p1.value,
          );
  }
}

extension on FespRadioListBuilderData {
  FespRadioListBuilderData copyWith({
    final RadioListTile Function(
      BuildContext p0,
      $FespRadioListBuilderData p1,
    )? fespBuilder0,
    Map<Object, Widget>? values,
    Object? currentValue,
    dynamic Function(Object?)? onChanged,
    Widget? subtitle,
    String? resetTitle,
  }) {
    return FespRadioListBuilderData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      values: values ?? this.values,
      currentValue: currentValue ?? this.currentValue,
      onChanged: onChanged ?? this.onChanged,
      subtitle: subtitle ?? this.subtitle,
      resetTitle: resetTitle ?? this.resetTitle,
    );
  }
}
