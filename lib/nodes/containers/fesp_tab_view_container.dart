import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespTabViewContainer extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget>? children;
  final double? tabHeight;
  final void Function(TabController controller)? onChange;

  const FespTabViewContainer({
    super.key,
    required this.tabs,
    this.children,
    this.tabHeight = 32,
    this.onChange,
  });

  @override
  State<FespTabViewContainer> createState() => _FespTabViewContainerState();
}

class _FespTabViewContainerState extends State<FespTabViewContainer>
    with TickerProviderStateMixin {
  late final TabController controller = TabController(
    length: widget.tabs.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (widget.onChange != null) {
      controller.addListener(
        () {
          widget.onChange!(controller);
        },
      );
    }

    if (widget.children != null && widget.children!.isNotEmpty) {
      children.add(
        Expanded(
          child: TabBarView(
            // physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: widget.children!,
          ),
        ),
      );
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: TAB_BAR_DEFAULT_COLOR(context),
          child: Center(
            child: TabBar(
              isScrollable: true,
              controller: controller,
              tabs: widget.tabs
                  .map(
                    (e) => Tab(
                      height: widget.tabHeight,
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
