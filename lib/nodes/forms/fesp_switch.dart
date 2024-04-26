import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:provider/provider.dart';

part 'fesp_switch.g.dart';

@FespNodeBuildersA(builders: [
  FespNodeBuilderField(
    className: 'FespSwitchBuilderData',
    argsList: [
      'BuildContext',
      '\$FespSwitchBuilderData',
    ],
    returnType: 'Switch',
    classFields: [
      FespNodeBuilderClassField(
        type: 'bool',
        name: 'value',
        defaultValue: 'false',
      ),
      FespNodeBuilderClassField(
        type: 'void Function(bool value)?',
        name: 'onChanged',
      ),
      FespNodeBuilderClassField(
        type: 'void Function(bool value)?',
        name: 'onFocusChange',
      ),
    ],
  ),
], invalidTypes: [
  '\$FespSwitchBuilderData',
  '\$FespSwitchBuilderData',
])
class FespSwitchData extends _$FespSwitchData {
  final $FespSwitchBuilderData initData;

  const FespSwitchData({
    this.initData = const $FespSwitchBuilderData(),
    super.fespBuilder0,
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

        return data._$fespBuilder0(
          context,
          $FespSwitchBuilderData(
            value: provider.getValue(),
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
