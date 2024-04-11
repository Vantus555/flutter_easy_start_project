// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_node_implement.dart';
import 'package:provider/provider.dart';

class _FespCheckboxListProvider extends ChangeNotifier {
  List<String> checkedList = [];

  _FespCheckboxListProvider(List<String>? checked) {
    checkedList = checked ?? [];
  }
}

class FespCheckboxList extends FespNode {
  final Function(List<String> values)? onChanged;
  final List<String>? currentValues;
  final Map<String, Widget> values;

  const FespCheckboxList({
    super.key,
    super.onCopyWith,
    this.onChanged,
    this.currentValues,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _FespCheckboxListProvider(currentValues),
      builder: (context, child) {
        List<Widget> children = [];
        final provider = context.watch<_FespCheckboxListProvider>();

        values.forEach((key, value) {
          final tile = CheckboxListTile(
            title: value,
            value: provider.checkedList.contains(key),
            onChanged: (value) {
              if (value!) {
                provider.checkedList.add(key);
                provider.notifyListeners();
              } else {
                provider.checkedList.remove(key);
                provider.notifyListeners();
              }
              if (onChanged != null) {
                onChanged!(provider.checkedList);
              }
            },
          );
          children.add(FespNode.getTrueNode(this, tile));
        });

        return Column(
          children: children,
        );
      },
    );
  }
}
