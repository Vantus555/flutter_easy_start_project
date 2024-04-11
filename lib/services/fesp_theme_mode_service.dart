// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/services/fesp_hive_service.dart';
import 'package:hive/hive.dart';

class FespThemeModeService {
  static const String _HIVE_SETTINGS_BOX = 'settings';
  static const String _HIVE_SETTINGS_BOX_THEME_MODE_KEY = 'themeMode';

  const FespThemeModeService();

  Future<ThemeMode> checkThemeModeFromHive() async {
    int value = await FespHiveService.get(
      _HIVE_SETTINGS_BOX,
      _HIVE_SETTINGS_BOX_THEME_MODE_KEY,
      defaultValue: ThemeMode.light.index,
    );

    switch (value) {
      case 1:
        return ThemeMode.light;
      default:
        return ThemeMode.dark;
    }
  }

  ThemeMode toggleCurrentThemeMode(ThemeMode data) {
    if (data == ThemeMode.light) {
      data = ThemeMode.dark;
    } else {
      data = ThemeMode.light;
    }

    Hive.openBox(_HIVE_SETTINGS_BOX).then(
      (box) async {
        await box.put(
          _HIVE_SETTINGS_BOX_THEME_MODE_KEY,
          data.index,
        );
      },
    );

    return data;
  }
}
