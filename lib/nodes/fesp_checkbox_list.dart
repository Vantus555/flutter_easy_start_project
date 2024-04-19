// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_builders.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:copy_with_extension/copy_with_extension.dart';

part 'fesp_checkbox_list.g.dart';

@CopyWith()
class FespCheckboxListBuilderData {
  final Widget title;
  final bool value;
  final void Function(bool?)? onChanged;

  const FespCheckboxListBuilderData({
    required this.title,
    required this.value,
    this.onChanged,
  });
}

class _FespCheckboxListProvider extends ChangeNotifier {
  List<String> checkedList = [];

  _FespCheckboxListProvider(List<String>? checked) {
    checkedList = checked ?? [];
  }
}

@FespNodeBuildersA()
class FespCheckboxList extends StatelessWidget {
  final Function(List<String> values)? onChanged;
  final List<String>? currentValues;
  final Map<String, Widget> values;

  @FespNodeBuilderFieldA(classFields: [
    'title',
    'value',
    'onChanged',
  ])
  final CheckboxListTile Function(FespCheckboxListBuilderData data)?
      fespBuilder1;

  const FespCheckboxList({
    super.key,
    this.onChanged,
    this.currentValues,
    this.fespBuilder1,
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
          onLocalChanged(value) {
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
          }

          final val = provider.checkedList.contains(key);

          children.add(
            _$fespBuilder1(
              FespCheckboxListBuilderData(
                title: value,
                value: val,
                onChanged: onLocalChanged,
              ),
            ),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }
}
