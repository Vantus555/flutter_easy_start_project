import 'package:hive_flutter/hive_flutter.dart';

class FespHiveService {
  static void init(Function() main) {
    Hive.initFlutter().then(
      (value) {
        main();
        Hive.close();
      },
    );
  }

  static Future<T> get<T>(
    String boxName,
    String key, {
    T? defaultValue,
  }) async {
    var box = await Hive.openBox(boxName);
    T data = await box.get(key, defaultValue: defaultValue);

    return data;
  }
}
