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
  $FespMenuAnchorBuilderData $copyWith({
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
  final void Function() onPressed;
  final Widget child;

  const $FespMenuItemButtonData({
    required this.onPressed,
    required this.child,
  });
  $FespMenuItemButtonData $copyWith({
    void Function()? onPressed,
    Widget? child,
  }) {
    return $FespMenuItemButtonData(
      onPressed: onPressed ?? this.onPressed,
      child: child ?? this.child,
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
            child: p1.child,
            onPressed: p1.onPressed,
          );
  }
}

extension on FespPopupMenuData {
  FespPopupMenuData $copyWith({
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
