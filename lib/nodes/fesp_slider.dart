// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_builders.dart';
import 'package:provider/provider.dart';

part 'fesp_slider.g.dart';

@CopyWith()
class FespSliderBuilderData {
  final int? divisions;
  final double min;
  final double max;
  final double value;
  final String label;
  final Function(double value)? onChanged;

  const FespSliderBuilderData({
    required this.value,
    this.label = '',
    this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
  });
}

@FespNodeBuildersA()
class FespSlideData {
  final int? divisions;
  final double min;
  final double max;
  final double value;
  final Function(double value)? onChanged;

  @FespNodeBuilderFieldA(
    classFields: [
      'divisions',
      'min',
      'max',
      'value',
      'label',
      'onChanged',
    ],
  )
  final Slider Function(BuildContext context, FespSliderBuilderData data)?
      fespBuilder1;

  const FespSlideData({
    required this.value,
    this.divisions,
    this.min = 0,
    this.max = 1,
    this.onChanged,
    this.fespBuilder1,
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
            initData._$fespBuilder1(
              context,
              FespSliderBuilderData(
                divisions: initData.divisions,
                min: initData.min,
                max: initData.max,
                value: provider.value,
                label: provider.value.round().toString(),
                onChanged: (double value) {
                  if (initData.onChanged != null) {
                    initData.onChanged!(provider.value);
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
