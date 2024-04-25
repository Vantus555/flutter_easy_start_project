import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_radio_list.g.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<Object?>;

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespRadioListBuilderData',
      returnType: 'RadioListTile',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Object',
          name: 'value',
        ),
        FespNodeBuilderClassField(
          type: 'Object?',
          name: 'groupValue',
        ),
        FespNodeBuilderClassField(
          type: 'void Function(Object?)?',
          name: 'onChanged',
        ),
        FespNodeBuilderClassField(
          type: 'Widget?',
          name: 'title',
        ),
        FespNodeBuilderClassField(
          type: 'Widget?',
          name: 'subtitle',
        ),
        FespNodeBuilderClassField(
          type: 'Color?',
          name: 'selectedTileColor',
        ),
        FespNodeBuilderClassField(
          type: 'bool',
          name: 'selected',
        ),
        FespNodeBuilderClassField(
          type: 'VisualDensity?',
          name: 'visualDensity',
        ),
        FespNodeBuilderClassField(
          type: 'ShapeBorder?',
          name: 'shape',
        ),
      ],
    ),
  ],
)
class FespRadioListBuilderData extends _$FespRadioListBuilderData {
  final Map<Object, Widget> values;
  final Object? currentValue;
  final Function(Object?)? onChanged;
  final Widget? subtitle;
  final String resetTitle;

  FespRadioListBuilderData({
    required this.values,
    required this.currentValue,
    this.onChanged,
    this.subtitle,
    this.resetTitle = 'Reset',
    super.fespBuilder0,
  });
}

class MyAppRadioList extends StatelessWidget {
  final FespRadioListBuilderData data;
  const MyAppRadioList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _providerType(
        value: data.currentValue,
      ),
      builder: (context, child) {
        final provider = context.watch<_providerType>();
        List<Widget> children = [];

        data.values.forEach(
          (key, value) {
            children.add(
              data._$fespBuilder0(
                context,
                $FespRadioListBuilderData(
                  value: key,
                  selected: key == provider.value,
                  groupValue: provider.value,
                  onChanged: (value) {
                    provider.setValue(value);
                    if (data.onChanged != null) {
                      data.onChanged!(value);
                    }
                  },
                  title: value,
                  subtitle: data.subtitle,
                  selectedTileColor: FESP_EXPANSION_COLOR(context),
                  visualDensity: VisualDensity.compact,
                  shape: FESP_SHAPE,
                ),
              ),
            );
          },
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () {
                  provider.setValue(null);
                  if (data.onChanged != null) {
                    data.onChanged!(null);
                  }
                },
                child: Text(data.resetTitle),
              ),
            ),
          ],
        );
      },
    );
  }
}
