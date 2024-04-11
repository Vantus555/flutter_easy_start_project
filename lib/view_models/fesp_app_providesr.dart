import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/router/fesp_router_factory.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item.dart';
import 'package:flutter_easy_start_project/structs/fesp_route.dart';
import 'package:go_router/go_router.dart';

class FespAppData {
  final List<FespRout>? routs;
  final List<FespNavItem>? navItems;
  late final GoRouter? router;

  FespAppData({this.routs, this.navItems}) {
    router = FespRouterFactory.getRouterConfig(navItems);
  }
}

class FespAppProvider extends ChangeNotifier {
  final FespAppData? data;

  FespAppProvider({this.data});
}
