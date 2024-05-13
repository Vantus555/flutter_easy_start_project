import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/view_models/fesp_theme_mode_provider.dart';
import 'package:provider/provider.dart';

class FespThemeToggler extends StatelessWidget {
  const FespThemeToggler({super.key});

  IconData getIcon(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return Icons.dark_mode;
    } else {
      return Icons.light_mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FespThemeModeProvider>();
    var themeMode =
        context.select((FespThemeModeProvider value) => value.currentThemeMode);

    return IconButton(
      icon: Icon(getIcon(themeMode)),
      onPressed: provider.toggleCurrentThemeMode,
    );
  }
}
