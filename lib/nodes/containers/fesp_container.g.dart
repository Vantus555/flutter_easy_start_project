// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_container.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespContainerBuilderData {
  final Widget child;
  final double width;
  final double? height;

  const $FespContainerBuilderData({
    required this.child,
    required this.width,
    this.height,
  });
  // ignore: unused_element
  $FespContainerBuilderData copyWith({
    Widget? child,
    double? width,
    double? height,
  }) {
    return $FespContainerBuilderData(
      child: child ?? this.child,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

class _$FespContainerData {
  final Container Function(
    BuildContext p0,
    $FespContainerBuilderData p1,
  )? fespBuilder0;

  const _$FespContainerData({
    this.fespBuilder0,
  });
  Container _$fespBuilder0(
    BuildContext p0,
    $FespContainerBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Container(
            height: p1.height,
            width: p1.width,
            child: p1.child,
          );
  }
}

extension on FespContainerData {
  // ignore: unused_element
  FespContainerData copyWith({
    final Container Function(
      BuildContext p0,
      $FespContainerBuilderData p1,
    )? fespBuilder0,
    FespContainerSize? size,
    FespContainerType? type,
    double? padding,
    double? margin,
    double? height,
  }) {
    return FespContainerData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      size: size ?? this.size,
      type: type ?? this.type,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      height: height ?? this.height,
    );
  }
}
