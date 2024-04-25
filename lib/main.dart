import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_vertical_tab_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_list_searcher.dart';
import 'package:flutter_easy_start_project/nodes/fesp_slide_up_panel.dart';
import 'package:flutter_easy_start_project/pages/fesp_app.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/pages/fesp_presentation_page.dart';
import 'package:flutter_easy_start_project/structs/fesp_app_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';

void main() {
  FespApp(
    data: FespAppData(
      mainContainerData: const FespContainerData(
        size: FespContainerSize.SM,
      ),
      navItems: [
        FespNavItemData(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          title: "main",
          label: "main",
          builder: (context, state) => const FespPresentationPage(),
          path: '/',
          name: 'index',
        ),
        FespNavItemData(
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings,
          title: "settings",
          label: "settings",
          builder: (context, state) => const MyWidget(),
          path: '/settings',
          name: 'settings',
          routes: [
            FespNavItemData(
              icon: Icons.settings_outlined,
              activeIcon: Icons.settings,
              title: 'settings1',
              path: 'settings1',
              name: 'settings1',
              builder: (context, state) => Text('settings1'),
            ),
            FespNavItemData(
              icon: Icons.settings_outlined,
              activeIcon: Icons.settings,
              title: 'settings2',
              path: 'settings2',
              name: 'settings2',
              builder: (context, state) => Text('settings2'),
              // isEnable: false,
            ),
          ],
        ),
      ],
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FespVerticalTabContainer(
      data: FespVerticalTabContainerData(
        listSearchData: FespListSearcherData(
          children: ['hello', 'find'],
          onChange: (element, index, value) {
            if (element.contains(value)) return Text(element);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
