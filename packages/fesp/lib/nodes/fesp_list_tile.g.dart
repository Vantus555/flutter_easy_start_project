// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_list_tile.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespListTileBuilderData {
  final Widget title;
  final Widget? leading;
  final Widget trailing;
  final ShapeBorder shape;
  final void Function()? onTap;

  const $FespListTileBuilderData({
    required this.title,
    this.leading,
    required this.trailing,
    required this.shape,
    this.onTap,
  });
  // ignore: unused_element
  $FespListTileBuilderData copyWith({
    Widget? title,
    Widget? leading,
    Widget? trailing,
    ShapeBorder? shape,
    void Function()? onTap,
  }) {
    return $FespListTileBuilderData(
      title: title ?? this.title,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
      shape: shape ?? this.shape,
      onTap: onTap ?? this.onTap,
    );
  }
}

class _$FespListTileData {
  final ListTile Function(
    BuildContext p0,
    $FespListTileBuilderData p1,
  )? fespBuilder0;

  const _$FespListTileData({
    this.fespBuilder0,
  });
  ListTile _$fespBuilder0(
    BuildContext p0,
    $FespListTileBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : ListTile(
            onTap: p1.onTap,
            shape: p1.shape,
            trailing: p1.trailing,
            leading: p1.leading,
            title: p1.title,
          );
  }
}

extension on FespListTileData {
  // ignore: unused_element
  FespListTileData copyWith({
    final ListTile Function(
      BuildContext p0,
      $FespListTileBuilderData p1,
    )? fespBuilder0,
    bool? material,
    Widget? title,
    dynamic Function()? onTap,
    Widget? trailing,
    Widget? leading,
    EdgeInsetsGeometry? padding,
  }) {
    return FespListTileData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      material: material ?? this.material,
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
      trailing: trailing ?? this.trailing,
      leading: leading ?? this.leading,
      padding: padding ?? this.padding,
    );
  }
}
