// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_checkbox_list.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespCheckboxListBuilderData {
  final Widget title;
  final bool value;
  final void Function(bool?) onChanged;

  const $FespCheckboxListBuilderData({
    required this.title,
    required this.value,
    required this.onChanged,
  });
  $FespCheckboxListBuilderData $copyWith({
    Widget? title,
    bool? value,
    void Function(bool?)? onChanged,
  }) {
    return $FespCheckboxListBuilderData(
      title: title ?? this.title,
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

extension on FespCheckboxList {
  CheckboxListTile _$fespBuilder0(
    BuildContext p0,
    $FespCheckboxListBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : CheckboxListTile(
            title: p1.title,
            value: p1.value,
            onChanged: p1.onChanged,
          );
  }

  FespCheckboxList $copyWith({
    dynamic Function(List<String>)? onChanged,
    List<String>? currentValues,
    Map<String, Widget>? values,
    CheckboxListTile Function(BuildContext, $FespCheckboxListBuilderData)?
        fespBuilder0,
  }) {
    return FespCheckboxList(
      onChanged: onChanged ?? this.onChanged,
      currentValues: currentValues ?? this.currentValues,
      values: values ?? this.values,
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
    );
  }
}
