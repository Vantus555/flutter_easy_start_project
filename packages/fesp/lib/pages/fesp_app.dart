import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_start_project/structs/fesp_app_data.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes.dart';
import 'package:flutter_easy_start_project/services/fesp_hive_service.dart';
import 'package:flutter_easy_start_project/view_models/fesp_app_providesr.dart';
import 'package:flutter_easy_start_project/view_models/fesp_refresh_page_provider.dart';
import 'package:flutter_easy_start_project/view_models/fesp_theme_mode_provider.dart';
import 'package:provider/provider.dart';

class FespApp {
  final FespAppData data;

  FespApp({this.data = const FespAppData()}) {
    FespHiveService.init(() {
      _setConfigurations();
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FespRefreshPageProvider()),
            ChangeNotifierProvider(
              create: (context) => FespAppProvider(data: data),
            ),
            ChangeNotifierProvider(
              create: (context) => FespThemeModeProvider(),
            ),
          ],
          child: const _Root(),
        ),
      );
    });
  }

  static void _setConfigurations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class _Root extends StatelessWidget {
  const _Root();

  @override
  Widget build(BuildContext context) {
    final key = context.select(
      (FespRefreshPageProvider value) => value.value,
    );
    final mode = context.select(
      (FespThemeModeProvider settings) => settings.currentThemeMode,
    );
    final router = context.read<FespAppProvider>().router;

    return SafeArea(
      key: key,
      child: MaterialApp.router(
        routerConfig: router,
        theme: FespTheme.lightTheme,
        darkTheme: FespTheme.darkTheme,
        themeMode: mode,
      ),
    );
  }
}
