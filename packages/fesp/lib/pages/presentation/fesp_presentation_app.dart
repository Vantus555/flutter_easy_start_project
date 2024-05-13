import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/pages/fesp_app.dart';
import 'package:flutter_easy_start_project/pages/presentation/fesp_presentation_page.dart';
import 'package:flutter_easy_start_project/structs/fesp_app_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';

class FespPresentationApp {
  FespPresentationApp() {
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
            icon: Icons.verified,
            activeIcon: Icons.home,
            title: "about",
            label: "about",
            builder: (context, state) => const FespText(text: 'page'),
            path: '/about',
            name: 'about',
          ),
        ],
      ),
    );
  }
}
