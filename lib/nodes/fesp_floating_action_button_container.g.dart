// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_floating_action_button_container.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespFloatingContainerData {
  final Widget child;

  const $FespFloatingContainerData({
    required this.child,
  });
  $FespFloatingContainerData $copyWith({
    Widget? child,
  }) {
    return $FespFloatingContainerData(
      child: child ?? this.child,
    );
  }
}

class _$FespFloatingActionButtonContainerData {
  final FespContainer Function(
    BuildContext p0,
    $FespFloatingContainerData p1,
  )? fespBuilder0;

  const _$FespFloatingActionButtonContainerData({
    this.fespBuilder0,
  });
  FespContainer _$fespBuilder0(
    BuildContext p0,
    $FespFloatingContainerData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : FespContainer(
            child: p1.child,
          );
  }
}

extension on FespFloatingActionButtonContainerData {
  FespFloatingActionButtonContainerData $copyWith({
    final FespContainer Function(
      BuildContext p0,
      $FespFloatingContainerData p1,
    )? fespBuilder0,
    Widget? child,
    Widget? action,
  }) {
    return FespFloatingActionButtonContainerData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      child: child ?? this.child,
      action: action ?? this.action,
    );
  }
}
