import 'package:flutter/material.dart';
import 'package:nedoctor_pro/project/app_consts.dart';
import 'package:nedoctor_pro/project/views/other/my_app_material.dart';

class MyAppListTile extends StatelessWidget {
  final bool material;
  final Widget title;
  final Function() onTap;
  final Widget? trailing;
  final Widget? leading;
  final EdgeInsetsGeometry padding;

  const MyAppListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.trailing = const Icon(Icons.keyboard_arrow_right_outlined),
    this.leading,
    this.material = true,
    this.padding = const EdgeInsets.all(5),
  });

  @override
  Widget build(BuildContext context) {
    var list = ListTile(
      leading: leading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConsts.TILE_DEFAULT_BORDER_RADIUS,
        ),
      ),
      title: title,
      trailing: trailing,
      onTap: onTap,
    );

    if (material) {
      return Padding(
        padding: padding,
        child: MyAppMaterial(
          child: list,
        ),
      );
    } else {
      return Padding(
        padding: padding,
        child: list,
      );
    }
  }
}
