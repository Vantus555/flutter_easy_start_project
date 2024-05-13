import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';

part 'fesp_floating_action_button.g.dart';

@FespNodeBuildersA(
  builders: [
    FespNodeBuilderField(
      className: 'FespFloatingActionButtonBuilderData',
      returnType: 'FloatingActionButton',
      classFields: [
        FespNodeBuilderClassField(
          type: 'Widget',
          name: 'child',
        ),
        FespNodeBuilderClassField(
          type: 'void Function()',
          name: 'onPressed',
        ),
        FespNodeBuilderClassField(
          type: 'bool',
          name: 'mini',
        ),
        FespNodeBuilderClassField(
          type: 'ShapeBorder',
          name: 'shape',
        ),
      ],
    ),
  ],
  invalidTypes: ['EdgeInsetsGeometry'],
)
class FespFloatingActionButtonData extends _$FespFloatingActionButtonData {
  final IconData icon;
  final void Function() onPressed;
  final bool mini;
  final EdgeInsetsGeometry padding;

  const FespFloatingActionButtonData({
    this.mini = false,
    required this.icon,
    required this.onPressed,
    this.padding = const EdgeInsets.all(10.0),
    super.fespBuilder0,
  });
}

class FespFloatingActionButton extends StatelessWidget {
  final FespFloatingActionButtonData data;

  const FespFloatingActionButton({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: data.padding,
      child: data._$fespBuilder0(
        context,
        $FespFloatingActionButtonBuilderData(
          mini: data.mini,
          onPressed: data.onPressed,
          shape: const CircleBorder(),
          child: Icon(data.icon),
        ),
      ),
    );
  }
}
