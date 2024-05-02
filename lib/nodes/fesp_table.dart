import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_multi_scroll.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

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

class FespTable extends StatelessWidget {
  final Widget emptyCell;
  final Widget firstCell;
  final double width;
  final double? height;
  final List<Widget>? horizontalHeaders;
  final List<Widget>? verticalHeaders;
  final List<List<Widget>> items;
  final Alignment horizontalAlignment;
  final TableCellVerticalAlignment verticalAlignment;

  static const Widget _emptyCell = Text('-');
  static const Widget _firstCell = Text('');
  static const Alignment _horizontalAlignment = Alignment.center;
  static const TableCellVerticalAlignment _verticalAlignment =
      TableCellVerticalAlignment.top;
  static const double _width = 250;

  const FespTable({
    super.key,
    this.emptyCell = _emptyCell,
    this.firstCell = _firstCell,
    this.width = _width,
    this.height,
    this.verticalHeaders,
    this.horizontalHeaders,
    required this.items,
    this.horizontalAlignment = _horizontalAlignment,
    this.verticalAlignment = _verticalAlignment,
  });

  factory FespTable.fromDict({
    Key? key,
    final Widget emptyCell = _emptyCell,
    final Widget firstCell = _firstCell,
    final double width = _width,
    final double? height,
    required final Map<MyAppTableDictContainer,
            Map<MyAppTableDictContainer, Widget>>
        items,
    final finishedTable = false,
    final Alignment horizontalAlignment = _horizontalAlignment,
    final TableCellVerticalAlignment verticalAlignment = _verticalAlignment,
  }) {
    final verticalData = items.values.map((e) => e.keys).toList();
    List<String> verticalHeadersString = [];
    List<Widget> verticalHeaders = [];

    for (var e in verticalData) {
      if (verticalHeaders.isEmpty) {
        verticalHeadersString = e.map((e) => e.title).toList();
        verticalHeaders = e.map((e) => e.value).toList();
        continue;
      }
      for (var element in e) {
        if (!verticalHeadersString.contains(element.title)) {
          verticalHeadersString.add(element.title);
          verticalHeaders.add(element.value);
        }
      }
    }

    List<String> horizontalHeadersString = [];
    List<Widget> horizontalHeaders = [];

    for (var element in items.keys) {
      final found = horizontalHeadersString.where(
        (e) => e == element.title,
      );

      if (found.isEmpty) {
        horizontalHeadersString.add(element.title);
        horizontalHeaders.add(element.value);
      }
    }

    List<List<Widget>> newItems = [];

    if (!finishedTable) {
      for (var vertical in verticalHeadersString) {
        List<Widget> objs = [];
        for (var horizontal in items.entries) {
          final found = horizontal.value.entries
              .where((element) => element.key.title == vertical)
              .toList();
          if (found.isEmpty) {
            objs.add(const Text('-'));
            continue;
          }
          objs.add(found[0].value);
        }
        newItems.add(objs);
      }
    } else {
      for (var horizontal in items.entries) {
        newItems.add(horizontal.value.entries.map((e) => e.value).toList());
      }
    }

    return FespTable(
      key: key,
      emptyCell: emptyCell,
      firstCell: firstCell,
      width: width,
      height: height,
      verticalHeaders: verticalHeaders,
      horizontalHeaders: horizontalHeaders,
      items: newItems,
      horizontalAlignment: horizontalAlignment,
      verticalAlignment: verticalAlignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TableRow> children = [];

    children.addAll(_getHorizontalHeaders());
    children.addAll(_getRows());

    return FespMultiScroll(
      child: Table(
        defaultColumnWidth: FixedColumnWidth(width),
        border: TableBorder.all(
          color: FESP_ACTIVE_COLOR(context),
        ),
        children: children,
      ),
    );
  }

  List<TableRow> _getHorizontalHeaders() {
    List<_Cell> headers = [];

    if (horizontalHeaders != null && verticalHeaders != null) {
      _addCell(headers, firstCell);
    }
    if (horizontalHeaders != null) {
      final maxCount = _getHorizontalMaxCount();

      for (var i = 0; i < maxCount; i++) {
        if (i + 1 > horizontalHeaders!.length) {
          _addCell(headers, emptyCell);
          continue;
        }
        _addCell(headers, horizontalHeaders![i]);
      }
    }

    if (headers.isEmpty) {
      return [];
    }
    return [TableRow(children: headers)];
  }

  List<TableRow> _getRows() {
    List<TableRow> rows = [];

    if (verticalHeaders != null) {
      final verticalMaxCount = _getVerticalMaxCount();

      for (var i = 0; i < verticalMaxCount; i++) {
        List<_Cell> widgets = [];
        if (i < verticalHeaders!.length) {
          _addCell(widgets, verticalHeaders![i]);
        } else {
          _addCell(widgets, emptyCell);
        }

        final horizontalMaxCount = _getHorizontalMaxCount();

        for (var cell = 0; cell < horizontalMaxCount; cell++) {
          if (i >= items.length) {
            _addCell(widgets, emptyCell);
            continue;
          }
          if (cell + 1 > items[i].length) {
            _addCell(widgets, emptyCell);
            continue;
          }
          _addCell(widgets, items[i][cell]);
        }
        rows.add(TableRow(children: widgets));
      }
    }

    return rows;
  }

  int _getHorizontalMaxCount() {
    int maxCount = 0;

    for (var e in items) {
      if (e.length > maxCount) maxCount = e.length;
    }

    if (horizontalHeaders != null) {
      if (horizontalHeaders!.length > maxCount) {
        maxCount = horizontalHeaders!.length;
      }
    }

    return maxCount;
  }

  int _getVerticalMaxCount() {
    return verticalHeaders == null
        ? items.length
        : max(
            items.length,
            verticalHeaders!.length,
          );
  }

  void _addCell(List<_Cell> data, Widget el) {
    data.add(
      _Cell(
        horizontalAlignment: horizontalAlignment,
        verticalAlignment: verticalAlignment,
        width: width,
        height: height,
        child: el,
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final Widget child;
  final Alignment horizontalAlignment;
  final TableCellVerticalAlignment verticalAlignment;
  final double? width;
  final double? height;

  const _Cell({
    required this.child,
    required this.horizontalAlignment,
    required this.verticalAlignment,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: verticalAlignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: Align(
          alignment: horizontalAlignment,
          child: SizedBox(
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
