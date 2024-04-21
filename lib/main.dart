import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/pages/fesp_app.dart';
import 'package:flutter_easy_start_project/nodes/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_text_field.dart';
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
        ),
        FespNavItemData(
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings,
          title: "settings",
          label: "settings",
          builder: (context, state) => const MyWidget(),
          path: '/settings',
        ),
      ],
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const FespTextField();
  }
}
