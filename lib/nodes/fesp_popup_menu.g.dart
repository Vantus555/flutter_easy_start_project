// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_popup_menu.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespMenuAnchorBuilderData {
  final Widget Function(BuildContext, MenuController, Widget?) builder;
  final List<Widget> menuChildren;

  const $FespMenuAnchorBuilderData({
    required this.builder,
    required this.menuChildren,
  });
  $FespMenuAnchorBuilderData copyWith({
    Widget Function(BuildContext, MenuController, Widget?)? builder,
    List<Widget>? menuChildren,
  }) {
    return $FespMenuAnchorBuilderData(
      builder: builder ?? this.builder,
      menuChildren: menuChildren ?? this.menuChildren,
    );
  }
}

class $FespMenuItemButtonData {
  final Widget child;
  final void Function() onPressed;

  const $FespMenuItemButtonData({
    required this.child,
    required this.onPressed,
  });
  $FespMenuItemButtonData copyWith({
    Widget? child,
    void Function()? onPressed,
  }) {
    return $FespMenuItemButtonData(
      child: child ?? this.child,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}

class _$FespPopupMenuData {
  final MenuAnchor Function(
    BuildContext p0,
    $FespMenuAnchorBuilderData p1,
  )? fespBuilder0;
  final MenuItemButton Function(
    BuildContext p0,
    $FespMenuItemButtonData p1,
  )? fespBuilder1;

  const _$FespPopupMenuData({
    this.fespBuilder0,
    this.fespBuilder1,
  });
  MenuAnchor _$fespBuilder0(
    BuildContext p0,
    $FespMenuAnchorBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : MenuAnchor(
            menuChildren: p1.menuChildren,
            builder: p1.builder,
          );
  }

  MenuItemButton _$fespBuilder1(
    BuildContext p0,
    $FespMenuItemButtonData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : MenuItemButton(
            onPressed: p1.onPressed,
            child: p1.child,
          );
  }
}

extension on FespPopupMenuData {
  FespPopupMenuData copyWith({
    final MenuAnchor Function(
      BuildContext p0,
      $FespMenuAnchorBuilderData p1,
    )? fespBuilder0,
    final MenuItemButton Function(
      BuildContext p0,
      $FespMenuItemButtonData p1,
    )? fespBuilder1,
    Map<Object, Widget>? items,
    dynamic Function(Object)? onChange,
  }) {
    return FespPopupMenuData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      fespBuilder1: fespBuilder1 ?? this.fespBuilder1,
      items: items ?? this.items,
      onChange: onChange ?? this.onChange,
    );
  }
}
