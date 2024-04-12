import 'package:flutter_easy_start_project/containers/fesp_base_page.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:go_router/go_router.dart';

abstract class FespRoutDataerFactory {
  static GoRouter? getRouterConfig(List<FespNavItemData>? navItems) {
    if (navItems == null) {
      return null;
    }

    List<StatefulShellBranch> branches = [];
    for (var e in navItems) {
      branches.add(
        StatefulShellBranch(
          routes: _getRouters([e]),
        ),
      );
    }

    GoRouter route = GoRouter(
      routes: [
        StatefulShellRoute.indexedStack(
          branches: branches,
          builder: (context, state, navigationShell) {
            return FespBasePage(
              key: state.pageKey,
              child: navigationShell,
            );
          },
        ),
      ],
    );

    return route;
  }

  static List<GoRoute> _getRouters(List<FespNavItemData>? navItems) {
    if (navItems == null) {
      return [];
    }

    List<GoRoute> routes = [];
    for (var element in navItems) {
      routes.add(
        GoRoute(
          path: element.path,
          builder: (context, state) {
            // state.pathParameters['title'] = element.title;
            return element.child;
          },
          routes: _getRouters(element.routes),
        ),
      );
    }

    return routes;
  }
}
