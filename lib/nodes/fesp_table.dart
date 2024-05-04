import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_start_project/nodes/fesp_multi_scroll.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<FespTableData>;

class MyAppTableDictContainer {
  final String title;
  final Widget value;

  const MyAppTableDictContainer({
    required this.title,
    required this.value,
  });

  @override
  // ignore: hash_and_equals, non_nullable_equals_parameter
  bool operator ==(Object? other) {
    if (other is MyAppTableDictContainer) return title == other.title;
    return super == (other);
  }
}

class FespTableData {
  final dynamic emptyCell;
  final double rowHeight = 45;
  final double? Function(int index)? rowHeightByIndex;
  final double cellWidth = 100;
  final double? Function(int x, int y)? cellWidthByIndex;
  final List<List<dynamic>> items;
  final Widget Function(dynamic item, int x, int y) builder;
  final Size gap;
  late final int verticalMaxCount;
  late final int horizontalMaxCount;

  FespTableData({
    this.emptyCell = '-',
    this.rowHeightByIndex,
    this.cellWidthByIndex,
    this.gap = const Size(0, 0),
    required this.items,
    required this.builder,
  }) {
    verticalMaxCount = items.length;

    int maxCount = 0;
    for (var e in items) {
      if (e.length > maxCount) maxCount = e.length;
    }
    horizontalMaxCount = maxCount;
  }
}

class FespTable extends StatelessWidget {
  final FespTableData data;

  const FespTable({
    super.key,
    required this.data,
  });

  // factory FespTable.fromDict({
  //   Key? key,
  //   required final Map<MyAppTableDictContainer,
  //           Map<MyAppTableDictContainer, Widget>>
  //       items,
  //   final finishedTable = false,
  // }) {
  //   final verticalData = items.values.map((e) => e.keys).toList();
  //   List<String> verticalHeadersString = [];
  //   List<Widget> verticalHeaders = [];

  //   for (var e in verticalData) {
  //     if (verticalHeaders.isEmpty) {
  //       verticalHeadersString = e.map((e) => e.title).toList();
  //       verticalHeaders = e.map((e) => e.value).toList();
  //       continue;
  //     }
  //     for (var element in e) {
  //       if (!verticalHeadersString.contains(element.title)) {
  //         verticalHeadersString.add(element.title);
  //         verticalHeaders.add(element.value);
  //       }
  //     }
  //   }

  //   List<String> horizontalHeadersString = [];
  //   List<Widget> horizontalHeaders = [];

  //   for (var element in items.keys) {
  //     final found = horizontalHeadersString.where(
  //       (e) => e == element.title,
  //     );

  //     if (found.isEmpty) {
  //       horizontalHeadersString.add(element.title);
  //       horizontalHeaders.add(element.value);
  //     }
  //   }

  //   List<List<Widget>> newItems = [];

  //   if (!finishedTable) {
  //     for (var vertical in verticalHeadersString) {
  //       List<Widget> objs = [];
  //       for (var horizontal in items.entries) {
  //         final found = horizontal.value.entries
  //             .where((element) => element.key.title == vertical)
  //             .toList();
  //         if (found.isEmpty) {
  //           objs.add(const Text('-'));
  //           continue;
  //         }
  //         objs.add(found[0].value);
  //       }
  //       newItems.add(objs);
  //     }
  //   } else {
  //     for (var horizontal in items.entries) {
  //       newItems.add(horizontal.value.entries.map((e) => e.value).toList());
  //     }
  //   }

  //   return FespTable(
  //     key: key,
  //     emptyCell: emptyCell,
  //     firstCell: firstCell,
  //     width: width,
  //     height: height,
  //     verticalHeaders: verticalHeaders,
  //     horizontalHeaders: horizontalHeaders,
  //     items: newItems,
  //     horizontalAlignment: horizontalAlignment,
  //     verticalAlignment: verticalAlignment,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _providerType(value: data),
      builder: (context, child) {
        List<Widget> children = [];

        children.addAll(_getRows());

        return FespMultiScroll(
          child: Column(
            children: children,
          ),
        );
      },
    );
  }

  void _addCell(List<_Cell> container, dynamic el, int x, int y) {
    if (el == null) {
      container.add(_Cell(child: data.emptyCell, x: x, y: y));
    } else {
      container.add(_Cell(child: el, x: x, y: y));
    }
  }

  List<_Row> _getRows() {
    List<_Row> rows = [];

    final horizontalMaxCount = data.horizontalMaxCount;
    final verticalMaxCount = data.verticalMaxCount;
    for (var i = 0; i < verticalMaxCount; i++) {
      List<_Cell> cells = [];

      // Other cells
      for (var cell = 0; cell < horizontalMaxCount; cell++) {
        dynamic el = data.emptyCell;
        if (i < data.items.length && cell + 1 <= data.items[i].length) {
          el = data.items[i][cell];
        }

        _addCell(cells, el, cell, i);
      }
      rows.add(_Row(index: i, children: cells));
    }

    return rows;
  }
}

class _Row extends StatelessWidget {
  final int index;
  final List<_Cell> children;

  const _Row({
    required this.children,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<_providerType>();
    final data = provider.getValue();

    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? 0 : data.gap.height,
      ),
      child: SizedBox(
        height: data.rowHeightByIndex == null
            ? data.rowHeight
            : data.rowHeightByIndex!(index) ?? data.rowHeight,
        child: Row(
          children: children,
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final int x;
  final int y;
  final String child;

  const _Cell({
    required this.x,
    required this.y,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<_providerType>();
    final data = provider.getValue();

    return FespMultiScroll(
      horizontal: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: x == 0 ? 0 : data.gap.width,
        ),
        child: Container(
          width: data.cellWidthByIndex == null
              ? data.cellWidth
              : data.cellWidthByIndex!(x, y) ?? data.cellWidth,
          height: data.rowHeightByIndex == null
              ? data.rowHeight
              : data.rowHeightByIndex!(x) ?? data.rowHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: FESP_ACTIVE_COLOR(context),
            ),
          ),
          child: data.builder(child, x, y),
        ),
      ),
    );
  }
}
