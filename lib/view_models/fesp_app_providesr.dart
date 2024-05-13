import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/router/fesp_router_factory.dart';
import 'package:flutter_easy_start_project/structs/fesp_app_data.dart';
import 'package:go_router/go_router.dart';

class FespAppProvider extends ChangeNotifier {
  final FespAppData data;
  final GoRouter? router;

  FespAppProvider({
    required this.data,
  }) : router = FespRoutDataerFactory.getRouterConfig(data.navItems);
}
