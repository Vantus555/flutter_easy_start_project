import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_list_searcher.dart';
import 'package:flutter_easy_start_project/nodes/fesp_responsive_layout.dart';
import 'package:flutter_easy_start_project/nodes/fesp_slide_up_panel.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<int>;

class FespVerticalTabContainerData {
  final List<String> titles;
  final List<Widget> children;

  FespVerticalTabContainerData({
    required this.titles,
    required this.children,
  }) : assert(!(children.length != titles.length),
            "children.length != titles.length");
}

class FespVerticalTabContainer extends StatelessWidget {
  final FespVerticalTabContainerData data;
  const FespVerticalTabContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _providerType(value: 0),
      builder: (context, child) {
        final list = _List(titles: data.titles, ctx: context);
        final content = _Content(children: data.children);

        return FespResponsiveLayout(
          parent: false,
          md: FespSlideUpPanel(
            collapseArea: const Text('collapse'),
            collapseChild: list,
            child: content,
          ),
          lg: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: list,
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(child: content),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  final List<String> titles;
  final BuildContext ctx;

  const _List({
    required this.titles,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return FespListSearcher(
      data: FespListSearcherData(
        children: titles,
        onChange: (element, index, value) {
          if (element.contains(value)) {
            return _Button(
              text: element,
              index: index,
              ctx: ctx,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final int index;
  final String text;
  final BuildContext ctx;

  const _Button({
    required this.text,
    required this.index,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    final provider = ctx.watch<_providerType>();

    Widget child;
    click() => provider.setValue(index);

    if (provider.getValue() == index) {
      child = ElevatedButton(
        onPressed: click,
        child: Text(text),
      );
    } else {
      child = TextButton(
        onPressed: click,
        child: Text(text),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}

class _Content extends StatelessWidget {
  final List<Widget> children;

  const _Content({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<_providerType>();
    return FespContainer(
      child: children[provider.getValue()],
    );
  }
}
