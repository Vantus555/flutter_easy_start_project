import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_start_project/nodes/fesp_multi_scroll.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<FespTableData>;

class FespTableData {
  static const double defautRowHeight = 45;
  static const double defautColWidth = 100;
  double _rowHeight = defautRowHeight;

  final dynamic emptyCell;
  final double? Function(int index)? rowHeightByIndex;
  final double? Function(int index)? colWidthByIndex;
  List<List<dynamic>>? rows;
  final Map<Object, Map<Object, Object>>? fromDict;
  final dynamic firstCell;
  final Widget Function(dynamic item, int x, int y) builder;
  final Size gap;
  late final int verticalMaxCount;
  late final int horizontalMaxCount;

  FespTableData({
    this.emptyCell = '-',
    this.rowHeightByIndex,
    this.colWidthByIndex,
    this.gap = const Size(0, 0),
    this.rows,
    this.fromDict,
    this.firstCell = '-',
    required this.builder,
  }) : assert((rows == null || fromDict == null),
            'One of them rows || fromDict must be != null') {
    if (fromDict == null) {
      verticalMaxCount = rows!.length;

      int maxCount = 0;
      for (var e in rows!) {
        if (e.length > maxCount) maxCount = e.length;
      }
      horizontalMaxCount = maxCount;
    } else {
      rows = [];
      final List<Object> verticalHeaders = fromDict!.entries
          .map(
            (e) => e.key,
          )
          .toList();
      final Set<Object> horizontalHeaders = {};

      final entries = fromDict!.entries;

      int maxCount = 0;
      for (var e in entries) {
        if (e.value.length > maxCount) maxCount = e.value.length;
        horizontalHeaders.addAll(e.value.keys);
      }
      verticalMaxCount = entries.length + 1;
      horizontalMaxCount = maxCount + 1;

      final horizontalHeadersList = horizontalHeaders.toList();
      rows!.addAll([
        [firstCell, ...horizontalHeadersList]
      ]);

      for (var v in verticalHeaders) {
        final List<dynamic> row = [];

        final dict = fromDict!;
        for (var i = 0; i < horizontalHeadersList.length; i++) {
          final h = horizontalHeadersList[i];
          if (dict[v]!.containsKey(h)) {
            row.add(dict[v]![h]!);
          } else {
            row.add(null);
          }
        }
        rows!.add([v, ...row]);
      }
    }
  }
}

class FespTable extends StatelessWidget {
  final FespTableData data;

  const FespTable({
    super.key,
    required this.data,
  });

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
      data._rowHeight = data.rowHeightByIndex == null
          ? FespTableData.defautRowHeight
          : data.rowHeightByIndex!(i) ?? FespTableData.defautRowHeight;

      // Other cells
      for (var cell = 0; cell < horizontalMaxCount; cell++) {
        dynamic el = data.emptyCell;
        if (i < data.rows!.length && cell + 1 <= data.rows![i].length) {
          el = data.rows![i][cell];
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
        height: data._rowHeight,
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
  final dynamic child;

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
          width: data.colWidthByIndex == null
              ? FespTableData.defautColWidth
              : data.colWidthByIndex!(x) ?? FespTableData.defautColWidth,
          height: data._rowHeight,
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
