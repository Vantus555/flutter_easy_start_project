import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_selector.g.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<Object>;

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespSelectorBuilderData',
      returnType: 'DropdownButtonFormField',
      classFields: [
        FespNodeBuilderClassField(
          type: 'bool',
          name: 'isExpanded',
          defaultValue: 'true',
        ),
        FespNodeBuilderClassField(
          type: 'InputDecoration',
          name: 'decoration',
        ),
        FespNodeBuilderClassField(
          type: 'Object',
          name: 'value',
        ),
        FespNodeBuilderClassField(
          type: 'List<DropdownMenuItem<Object>>',
          name: 'items',
        ),
        FespNodeBuilderClassField(
          type: 'void Function(dynamic value)?',
          name: 'onChanged',
        ),
      ],
    ),
    FespNodeBuilderField(
      className: 'FespDropdownMenuItemBuilderData',
      returnType: 'DropdownMenuItem<Object>',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
        FespNodeBuilderClassField(
          type: 'Object',
          name: 'value',
        ),
      ],
    ),
  ],
  invalidTypes: ['EdgeInsetsGeometry'],
)
class FespSelector extends _$FespSelector {
  final Map<Object, Widget> items;
  final String labelText;
  final Object initializeValue;
  final void Function(dynamic value)? onChanged;
  final EdgeInsetsGeometry padding;

  const FespSelector({
    required this.items,
    required this.labelText,
    required this.initializeValue,
    this.onChanged,
    this.padding = const EdgeInsets.all(10),
    super.fespBuilder0,
    super.fespBuilder1,
  });

  List<DropdownMenuItem<Object>> trueItems(BuildContext p0) {
    List<DropdownMenuItem<Object>> trueItems = [];

    if (items.isEmpty) {
      trueItems = items.entries
          .map(
            (e) => _$fespBuilder1(
              p0,
              $FespDropdownMenuItemBuilderData(
                value: e.key,
                child: e.value,
              ),
            ),
          )
          .toList();
    }
    return trueItems;
  }
}

class MyAppSelector extends StatelessWidget {
  final FespSelector data;

  const MyAppSelector({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _providerType(value: data.initializeValue),
      builder: (context, child) {
        final provider = context.watch<_providerType>();

        return Padding(
          padding: data.padding,
          child: data._$fespBuilder0(
            context,
            $FespSelectorBuilderData(
              decoration: InputDecoration(
                border: FESP_TEXT_INPUT_BORDER,
                labelText: data.labelText,
                contentPadding: FESP_TEXT_INPUT_CONTENT_PADDING,
              ),
              value: provider.value,
              items: data.trueItems(context),
              onChanged: (value) {
                provider.setValue(value);
                if (data.onChanged != null && value != null) {
                  data.onChanged!(value);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
