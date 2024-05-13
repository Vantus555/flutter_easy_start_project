import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/services/fesp_theme_mode_service.dart';

class _FespThemeModeDataProvider {
  ThemeMode currentThemeMode = ThemeMode.light;
  final settingsService = const FespThemeModeService();
}

class FespThemeModeProvider extends ChangeNotifier {
  final _data = _FespThemeModeDataProvider();

  get currentThemeMode => _data.currentThemeMode;

  FespThemeModeProvider() {
    _data.settingsService.checkThemeModeFromHive().then(
      (mode) {
        _data.currentThemeMode = mode;
        notifyListeners();
      },
    );
  }

  void toggleCurrentThemeMode() {
    _data.currentThemeMode = _data.settingsService.toggleCurrentThemeMode(
      _data.currentThemeMode,
    );
    notifyListeners();
  }
}
