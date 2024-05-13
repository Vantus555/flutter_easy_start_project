// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:fesp_node_builders/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_slider.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespSliderBuilderData',
      argsList: [
        'BuildContext',
        '\$FespSliderBuilderData',
      ],
      returnType: 'Slider',
      classFields: [
        FespNodeBuilderClassField(
          type: 'int?',
          name: 'divisions',
        ),
        FespNodeBuilderClassField(
          type: 'double',
          name: 'min',
          defaultValue: '0',
        ),
        FespNodeBuilderClassField(
          type: 'double',
          name: 'max',
          defaultValue: '1',
        ),
        FespNodeBuilderClassField(
          type: 'double',
          name: 'value',
        ),
        FespNodeBuilderClassField(
          type: 'String',
          name: 'label',
        ),
        FespNodeBuilderClassField(
          type: 'Function(double value)?',
          name: 'onChanged',
        ),
      ],
    ),
  ],
  invalidTypes: ['\$FespSliderBuilderData'],
)
class FespSlideData extends _$FespSlideData {
  final int? divisions;
  final double min;
  final double max;
  final double value;
  final Function(double value)? onChanged;

  const FespSlideData({
    required this.value,
    this.divisions,
    this.min = 0,
    this.max = 1,
    this.onChanged,
    super.fespBuilder0,
  });
}

class FespSlider extends StatelessWidget {
  final FespSlideData initData;

  const FespSlider({
    super.key,
    required this.initData,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          FespValueChangeProvider<double>(value: initData.value),
      builder: (context, child) {
        final provider = context.watch<FespValueChangeProvider<double>>();
        return Row(
          children: [
            Text(provider.getValue().toString()),
            initData._$fespBuilder0(
              context,
              $FespSliderBuilderData(
                divisions: initData.divisions,
                min: initData.min,
                max: initData.max,
                value: provider.getValue(),
                label: provider.getValue().round().toString(),
                onChanged: (double value) {
                  if (initData.onChanged != null) {
                    initData.onChanged!(provider.getValue());
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
