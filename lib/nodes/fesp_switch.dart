import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_builders.dart';

part 'fesp_switch.g.dart';

@CopyWith()
class FespSwitchBuilderData {
  final bool value;
  final void Function(bool value)? onChanged;
  final void Function(bool value)? onFocusChange;

  const FespSwitchBuilderData({
    this.value = false,
    this.onChanged,
    this.onFocusChange,
  });
}

@FespNodeBuildersA()
class FespSwitchData {
  final FespSwitchBuilderData initData;
  @FespNodeBuilderFieldA(classFields: [
    'value',
    'onChanged',
    'onFocusChange',
  ])
  final Switch Function(FespSwitchBuilderData data)? fespBuilder1;

  const FespSwitchData({
    this.initData = const FespSwitchBuilderData(),
    this.fespBuilder1,
  });
}

class FespSwitch extends StatelessWidget {
  final FespSwitchData data;

  const FespSwitch({
    super.key,
    this.data = const FespSwitchData(),
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          FespValueChangeProvider<bool>(value: data.initData.value),
      builder: (context, child) {
        final provider = context.watch<FespValueChangeProvider<bool>>();

        return data._$fespBuilder1(
          FespSwitchBuilderData(
            value: provider.value,
            onChanged: (value) {
              provider.setValue(value);
              if (data.initData.onChanged != null) {
                data.initData.onChanged!(value);
              }
            },
            onFocusChange: data.initData.onFocusChange,
          ),
        );
      },
    );
  }
}
