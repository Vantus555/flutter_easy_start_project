import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/structs/fesp_nav_item_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_responsive_layout_data.dart';
import 'package:flutter_easy_start_project/structs/fesp_route_data.dart';

class FespAppData {
  final List<FespRoutData>? routs;
  final List<FespNavItemData>? navItems;
  final FespResponsiveLayoutData responsiveData;
  final FespContainerData mainContainerData;

  const FespAppData({
    this.routs,
    this.navItems,
    this.responsiveData = const FespResponsiveLayoutData(),
    this.mainContainerData = const FespContainerData(),
  });
}
