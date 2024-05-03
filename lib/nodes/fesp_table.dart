import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
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
  final String emptyCell;
  final String firstCell;

  final List<String>? horizontalHeaders;
  final List<String>? verticalHeaders;

  final double rowHeight = 45;
  final double? Function(int index)? rowHeightByIndex;

  final double cellWidth = 100;
  final double? Function(int x, int y)? cellWidthByIndex;

  final List<List<String>> items;
  final Widget Function(String item, int x, int y) builder;

  FespTableData({
    this.emptyCell = '-',
    this.firstCell = '',
    this.horizontalHeaders,
    this.verticalHeaders,
    this.rowHeightByIndex,
    this.cellWidthByIndex,
    required this.items,
    required this.builder,
  });
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

        children.addAll(_getHorizontalHeaders());
        children.addAll(_getRows());

        return FespMultiScroll(
          child: Column(
            children: children,
          ),
        );
      },
    );
  }

  List<Widget> _getHorizontalHeaders() {
    List<_Cell> headers = [];

    // firstCell
    if (data.horizontalHeaders != null && data.verticalHeaders != null) {
      headers.add(_Cell(child: data.firstCell, x: 0, y: 0));
    }

    // Othe cells
    if (data.horizontalHeaders != null) {
      final maxCount = _getHorizontalMaxCount();

      for (var i = 0; i < maxCount; i++) {
        if (i + 1 > data.horizontalHeaders!.length) {
          headers.add(_Cell(child: data.emptyCell, x: 0, y: i + 1));
          continue;
        }
        headers.add(_Cell(child: data.horizontalHeaders![i], x: 0, y: i + 1));
      }
    }

    if (headers.isEmpty) {
      return [];
    }
    return [_Row(index: 0, children: headers)];
  }

  List<_Row> _getRows() {
    List<_Row> rows = [];

    final verticalMaxCount = _getVerticalMaxCount();

    for (var i = 0; i < verticalMaxCount; i++) {
      List<_Cell> cells = [];

      // vertical header
      if (data.verticalHeaders != null) {
        if (i < data.verticalHeaders!.length) {
          // child
          cells.add(_Cell(child: data.verticalHeaders![i], x: 0, y: i + 1));
        } else {
          // emptyCell
          cells.add(_Cell(child: data.emptyCell, x: 0, y: i + 1));
        }
      }

      final horizontalMaxCount = _getHorizontalMaxCount();

      // Other cells
      for (var cell = 0; cell < horizontalMaxCount; cell++) {
        // emptyCell
        if (i >= data.items.length) {
          cells.add(_Cell(child: data.emptyCell, x: cell, y: i + 1));
          continue;
        }
        // emptyCell
        if (cell + 1 > data.items[i].length) {
          cells.add(_Cell(child: data.emptyCell, x: cell, y: i + 1));
          continue;
        }
        // child
        cells.add(_Cell(child: data.items[i][cell], x: cell, y: i + 1));
      }
      rows.add(_Row(index: i + 1, children: cells));
    }

    return rows;
  }

  int _getHorizontalMaxCount() {
    int maxCount = 0;

    for (var e in data.items) {
      if (e.length > maxCount) maxCount = e.length;
    }

    if (data.horizontalHeaders != null) {
      return max(data.horizontalHeaders!.length, maxCount);
    }

    return maxCount;
  }

  int _getVerticalMaxCount() {
    return data.verticalHeaders == null
        ? data.items.length
        : max(
            data.items.length,
            data.verticalHeaders!.length,
          );
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

    return SizedBox(
      height: data.rowHeightByIndex == null
          ? data.rowHeight
          : data.rowHeightByIndex!(index) ?? data.rowHeight,
      child: Row(
        children: children,
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

    return Container(
      width: data.cellWidthByIndex == null
          ? data.cellWidth
          : data.cellWidthByIndex!(x, y) ?? data.cellWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: FESP_ACTIVE_COLOR(context),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: FespMultiScroll(
          horizontal: false,
          child: data.builder(child, x, y),
        ),
      ),
    );
  }
}
