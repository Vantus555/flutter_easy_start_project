// import 'package:flutter/material.dart';
// import 'package:flutter_easy_start_project/nodes/fesp_material.dart';
// import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

// class FespExpansionTile extends StatelessWidget {
//   final List<Widget> children;
//   final Widget title;
//   final bool material;
//   final EdgeInsetsGeometry padding;
//   final ExpansionTile Function() builder;

//   const FespExpansionTile({
//     super.key,
//     required this.title,
//     this.children = const [],
//     this.material = true,
//     this.padding = FESP_TILE_PADDING,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var child = ExpansionTile(
//       expandedCrossAxisAlignment: CrossAxisAlignment.start,
//       expandedAlignment: Alignment.topLeft,
//       childrenPadding: FESP_CHILDREN_PADDING,
//       title: title,
//       backgroundColor: FESP_EXPANSION_COLOR(context),
//       children: children,
//     );

//     if (material) {
//       return Padding(
//         padding: padding,
//         child: FespMaterial(
//           child: child,
//         ),
//       );
//     } else {
//       return Padding(
//         padding: padding,
//         child: child,
//       );
//     }
//   }
// }
