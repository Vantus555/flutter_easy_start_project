// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_material.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespMaterialBuilderData {
  final BorderRadius borderRadius;
  final double elevation;
  final Color shadowColor;
  final Widget child;

  const $FespMaterialBuilderData({
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
    required this.child,
  });
  $FespMaterialBuilderData $copyWith({
    BorderRadius? borderRadius,
    double? elevation,
    Color? shadowColor,
    Widget? child,
  }) {
    return $FespMaterialBuilderData(
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      child: child ?? this.child,
    );
  }
}

extension on FespMaterial {
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
            borderRadius: p1.borderRadius,
            elevation: p1.elevation,
            shadowColor: p1.shadowColor,
            child: p1.child,
          );
  }

  FespMaterial $copyWith({
    Widget? child,
    Material Function(BuildContext, $FespMaterialBuilderData)? fespBuilder0,
  }) {
    return FespMaterial(
      child: child ?? this.child,
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
    );
  }
}
