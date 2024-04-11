import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_checkbox_list.dart';

class FespDemo extends StatelessWidget {
  const FespDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        const FespCheckboxList(values: {
          '1': Text('1'),
          '2': Text('2'),
        })
      ],
    );
  }
}
