// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_selector.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespSelectorBuilderData {
  final bool isExpanded;
  final InputDecoration decoration;
  final Object value;
  final List<DropdownMenuItem<Object>> items;
  final void Function(dynamic value)? onChanged;

  const $FespSelectorBuilderData({
    this.isExpanded = true,
    required this.decoration,
    required this.value,
    required this.items,
    this.onChanged,
  });
  $FespSelectorBuilderData $copyWith({
    bool? isExpanded,
    InputDecoration? decoration,
    Object? value,
    List<DropdownMenuItem<Object>>? items,
    void Function(dynamic value)? onChanged,
  }) {
    return $FespSelectorBuilderData(
      isExpanded: isExpanded ?? this.isExpanded,
      decoration: decoration ?? this.decoration,
      value: value ?? this.value,
      items: items ?? this.items,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

class $FespDropdownMenuItemBuilderData {
  final Object value;
  final Widget child;

  const $FespDropdownMenuItemBuilderData({
    required this.value,
    required this.child,
  });
  $FespDropdownMenuItemBuilderData $copyWith({
    Object? value,
    Widget? child,
  }) {
    return $FespDropdownMenuItemBuilderData(
      value: value ?? this.value,
      child: child ?? this.child,
    );
  }
}

class _$FespSelector {
  final DropdownButtonFormField Function(
    BuildContext p0,
    $FespSelectorBuilderData p1,
  )? fespBuilder0;
  final DropdownMenuItem<Object> Function(
    BuildContext p0,
    $FespDropdownMenuItemBuilderData p1,
  )? fespBuilder1;

  const _$FespSelector({
    this.fespBuilder0,
    this.fespBuilder1,
  });
  DropdownButtonFormField _$fespBuilder0(
    BuildContext p0,
    $FespSelectorBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : DropdownButtonFormField(
            onChanged: p1.onChanged,
            items: p1.items,
            value: p1.value,
            decoration: p1.decoration,
            isExpanded: p1.isExpanded,
          );
  }

  DropdownMenuItem<Object> _$fespBuilder1(
    BuildContext p0,
    $FespDropdownMenuItemBuilderData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : DropdownMenuItem<Object>(
            child: p1.child,
            value: p1.value,
          );
  }
}

extension on FespSelector {
  FespSelector $copyWith({
    final DropdownButtonFormField Function(
      BuildContext p0,
      $FespSelectorBuilderData p1,
    )? fespBuilder0,
    final DropdownMenuItem<Object> Function(
      BuildContext p0,
      $FespDropdownMenuItemBuilderData p1,
    )? fespBuilder1,
    Map<Object, Widget>? items,
    String? labelText,
    Object? initializeValue,
    void Function(dynamic)? onChanged,
    EdgeInsetsGeometry? padding,
  }) {
    return FespSelector(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      fespBuilder1: fespBuilder1 ?? this.fespBuilder1,
      items: items ?? this.items,
      labelText: labelText ?? this.labelText,
      initializeValue: initializeValue ?? this.initializeValue,
      onChanged: onChanged ?? this.onChanged,
      padding: padding ?? this.padding,
    );
  }
}
