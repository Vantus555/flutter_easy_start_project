import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_container.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_floating_action_button_container.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespFloatingContainerBuilderData',
      returnType: 'FespContainer',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
      ],
    ),
  ],
)
class FespFloatingActionButtonContainerData
    extends _$FespFloatingActionButtonContainerData {
  final Widget child;
  final Widget action;

  FespFloatingActionButtonContainerData({
    required this.child,
    required this.action,
    super.fespBuilder0,
  });
}

class FespFloatingActionButtonContainer extends StatelessWidget {
  final FespFloatingActionButtonContainerData data;
  const FespFloatingActionButtonContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        data._$fespBuilder0(
          context,
          $FespFloatingContainerBuilderData(
            child: data.child,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: data.action,
        ),
      ],
    );
  }
}
