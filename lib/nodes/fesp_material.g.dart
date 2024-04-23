// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_material.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespMaterialBuilderData {
  final Widget child;
  final BorderRadius borderRadius;
  final double elevation;
  final Color shadowColor;

  const $FespMaterialBuilderData({
    required this.child,
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
  });
  $FespMaterialBuilderData copyWith({
    Widget? child,
    BorderRadius? borderRadius,
    double? elevation,
    Color? shadowColor,
  }) {
    return $FespMaterialBuilderData(
      child: child ?? this.child,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }
}

class _$FespMaterialData {
  final Material Function(
    BuildContext p0,
    $FespMaterialBuilderData p1,
  )? fespBuilder0;

  const _$FespMaterialData({
    this.fespBuilder0,
  });
  Material _$fespBuilder0(
    BuildContext p0,
    $FespMaterialBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Material(
            shadowColor: p1.shadowColor,
            elevation: p1.elevation,
            borderRadius: p1.borderRadius,
            child: p1.child,
          );
  }
}

extension on FespMaterialData {
  FespMaterialData copyWith({
    final Material Function(
      BuildContext p0,
      $FespMaterialBuilderData p1,
    )? fespBuilder0,
    Widget? child,
  }) {
    return FespMaterialData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      child: child ?? this.child,
    );
  }
}
