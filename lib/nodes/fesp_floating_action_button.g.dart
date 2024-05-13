// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_floating_action_button.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespFloatingActionButtonBuilderData {
  final Widget child;
  final void Function() onPressed;
  final bool mini;
  final ShapeBorder shape;

  const $FespFloatingActionButtonBuilderData({
    required this.child,
    required this.onPressed,
    required this.mini,
    required this.shape,
  });
  // ignore: unused_element
  $FespFloatingActionButtonBuilderData copyWith({
    Widget? child,
    void Function()? onPressed,
    bool? mini,
    ShapeBorder? shape,
  }) {
    return $FespFloatingActionButtonBuilderData(
      child: child ?? this.child,
      onPressed: onPressed ?? this.onPressed,
      mini: mini ?? this.mini,
      shape: shape ?? this.shape,
    );
  }
}

class _$FespFloatingActionButtonData {
  final FloatingActionButton Function(
    BuildContext p0,
    $FespFloatingActionButtonBuilderData p1,
  )? fespBuilder0;

  const _$FespFloatingActionButtonData({
    this.fespBuilder0,
  });
  FloatingActionButton _$fespBuilder0(
    BuildContext p0,
    $FespFloatingActionButtonBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : FloatingActionButton(
            shape: p1.shape,
            mini: p1.mini,
            onPressed: p1.onPressed,
            child: p1.child,
          );
  }
}

extension on FespFloatingActionButtonData {
  // ignore: unused_element
  FespFloatingActionButtonData copyWith({
    final FloatingActionButton Function(
      BuildContext p0,
      $FespFloatingActionButtonBuilderData p1,
    )? fespBuilder0,
    IconData? icon,
    void Function()? onPressed,
    bool? mini,
    EdgeInsetsGeometry? padding,
  }) {
    return FespFloatingActionButtonData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      icon: icon ?? this.icon,
      onPressed: onPressed ?? this.onPressed,
      mini: mini ?? this.mini,
      padding: padding ?? this.padding,
    );
  }
}
