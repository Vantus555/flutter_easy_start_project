import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_start_project/nodes/fesp_list_searcher.dart';

class FespVerticalTabContainerData {
  final FespListSearcherData listSearchData;

  FespVerticalTabContainerData({
    required this.listSearchData,
  });
}

class FespVerticalTabContainer extends StatelessWidget {
  final FespVerticalTabContainerData data;
  const FespVerticalTabContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FespListSearcher(
            data: data.listSearchData,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text('data'),
        ),
      ],
    );
  }
}
