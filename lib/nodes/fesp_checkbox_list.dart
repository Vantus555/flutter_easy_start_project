import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_checkbox_list.g.dart';

typedef ProviderType = FespValueChangeProvider<List<String>>;

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespCheckboxListBuilderData',
      returnType: 'CheckboxListTile',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'title',
        ),
        FespNodeBuilderClassField(
          type: 'bool',
          name: 'value',
        ),
        FespNodeBuilderClassField(
          type: 'void Function(bool?)',
          name: 'onChanged',
        ),
      ],
    ),
  ],
  invalidTypes: ['\$FespCheckboxListBuilderData'],
)
class FespCheckboxList extends StatelessWidget {
  final Function(List<String> values)? onChanged;
  final List<String> currentValues;
  final Map<String, Widget> values;

  final CheckboxListTile Function(
    BuildContext context,
    $FespCheckboxListBuilderData data,
  )? fespBuilder0;

  const FespCheckboxList({
    super.key,
    this.onChanged,
    this.currentValues = const [],
    this.fespBuilder0,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderType(value: currentValues),
      builder: (context, child) {
        List<Widget> children = [];
        final provider = context.watch<ProviderType>();

        values.forEach((key, value) {
          onLocalChanged(value) {
            if (value!) {
              provider.value.add(key);
              provider.notifyListeners();
            } else {
              provider.value.remove(key);
              provider.notifyListeners();
            }
            if (onChanged != null) {
              onChanged!(provider.value);
            }
          }

          final val = provider.value.contains(key);

          children.add(
            _$fespBuilder0(
              context,
              $FespCheckboxListBuilderData(
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
