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
  $FespCheckboxListBuilderData copyWith({
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

class _$FespCheckboxListData {
  final CheckboxListTile Function(
    BuildContext p0,
    $FespCheckboxListBuilderData p1,
  )? fespBuilder0;

  const _$FespCheckboxListData({
    this.fespBuilder0,
  });
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
            onChanged: p1.onChanged,
            value: p1.value,
            title: p1.title,
          );
  }
}

extension on FespCheckboxListData {
  FespCheckboxListData copyWith({
    final CheckboxListTile Function(
      BuildContext p0,
      $FespCheckboxListBuilderData p1,
    )? fespBuilder0,
    dynamic Function(List<String>)? onChanged,
    List<String>? currentValues,
    Map<String, Widget>? values,
  }) {
    return FespCheckboxListData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      onChanged: onChanged ?? this.onChanged,
      currentValues: currentValues ?? this.currentValues,
      values: values ?? this.values,
    );
  }
}
