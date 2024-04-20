// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_expansion_tile.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespExpansionTileBuilderData {
  final CrossAxisAlignment expandedCrossAxisAlignment;
  final Alignment expandedAlignment;
  final EdgeInsetsGeometry childrenPadding;
  final Widget title;
  final Color backgroundColor;
  final List<Widget> children;

  const $FespExpansionTileBuilderData({
    required this.expandedCrossAxisAlignment,
    required this.expandedAlignment,
    required this.childrenPadding,
    required this.title,
    required this.backgroundColor,
    required this.children,
  });
  $FespExpansionTileBuilderData $copyWith({
    CrossAxisAlignment? expandedCrossAxisAlignment,
    Alignment? expandedAlignment,
    EdgeInsetsGeometry? childrenPadding,
    Widget? title,
    Color? backgroundColor,
    List<Widget>? children,
  }) {
    return $FespExpansionTileBuilderData(
      expandedCrossAxisAlignment:
          expandedCrossAxisAlignment ?? this.expandedCrossAxisAlignment,
      expandedAlignment: expandedAlignment ?? this.expandedAlignment,
      childrenPadding: childrenPadding ?? this.childrenPadding,
      title: title ?? this.title,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      children: children ?? this.children,
    );
  }
}

class _$FespExpansionTileData {
  final ExpansionTile Function(
    BuildContext p0,
    $FespExpansionTileBuilderData p1,
  )? fespBuilder0;

  const _$FespExpansionTileData({
    this.fespBuilder0,
  });
  ExpansionTile _$fespBuilder0(
    BuildContext p0,
    $FespExpansionTileBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : ExpansionTile(
            children: p1.children,
            backgroundColor: p1.backgroundColor,
            title: p1.title,
            childrenPadding: p1.childrenPadding,
            expandedAlignment: p1.expandedAlignment,
            expandedCrossAxisAlignment: p1.expandedCrossAxisAlignment,
          );
  }
}

extension on FespExpansionTileData {
  FespExpansionTileData $copyWith({
    final ExpansionTile Function(
      BuildContext p0,
      $FespExpansionTileBuilderData p1,
    )? fespBuilder0,
    List<Widget>? children,
    Widget? title,
    bool? material,
    EdgeInsetsGeometry? padding,
  }) {
    return FespExpansionTileData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      children: children ?? this.children,
      title: title ?? this.title,
      material: material ?? this.material,
      padding: padding ?? this.padding,
    );
  }
}
