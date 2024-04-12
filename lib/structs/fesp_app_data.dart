import 'package:flutter_easy_start_project/router/fesp_router_factory.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_responsive_layout_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_route_data.dart';
import 'package:go_router/go_router.dart';

class FespAppData {
  final List<FespRoutData>? routs;
  final List<FespNavItemData>? navItems;
  final FespResponsiveLayoutData responsiveData;

  const FespAppData({
    this.routs,
    this.navItems,
    this.responsiveData = const FespResponsiveLayoutData(),
  });

  GoRouter? get router {
    return FespRoutDataerFactory.getRouterConfig(navItems);
  }
}
