// import 'package:flutter/material.dart';
// import 'package:nedoctor_pro/project/app_consts.dart';

// class MyAppTabViewContainer extends StatefulWidget {
//   final List<Widget> tabs;
//   final List<Widget>? tabBarViewChildren;
//   final Widget? generalChild;
//   final double? tabHeight;
//   final void Function(TabController controller)? onChange;

//   const MyAppTabViewContainer({
//     super.key,
//     required this.tabs,
//     this.tabBarViewChildren,
//     this.generalChild,
//     this.tabHeight = AppConsts.TABS_HEIGHT,
//     this.onChange,
//   });

//   @override
//   State<MyAppTabViewContainer> createState() => _MyAppTabViewContainerState();
// }

// class _MyAppTabViewContainerState extends State<MyAppTabViewContainer>
//     with TickerProviderStateMixin {
//   late final TabController controller = TabController(
//     length: widget.tabs.length,
//     vsync: this,
//   );

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> children = [];
//     if (widget.onChange != null) {
//       controller.addListener(
//         () {
//           widget.onChange!(controller);
//         },
//       );
//     }

//     if (widget.generalChild != null) {
//       children.add(widget.generalChild!);
//     }
//     if (widget.tabBarViewChildren != null &&
//         widget.tabBarViewChildren!.isNotEmpty) {
//       children.add(
//         Expanded(
//           child: TabBarView(
//             controller: controller,
//             children: widget.tabBarViewChildren!,
//           ),
//         ),
//       );
//     }

//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           color: AppConsts.TAB_BAR_DEFAULT_COLOR(context),
//           child: Center(
//             child: TabBar(
//               isScrollable: true,
//               controller: controller,
//               tabs: widget.tabs
//                   .map(
//                     (e) => Tab(
//                       height: widget.tabHeight,
//                       child: e,
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ),
//         ...children,
//       ],
//     );
//   }
// }
