import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/structs/fesp_app_data.dart';

class FespAppProvider extends ChangeNotifier {
  final FespAppData data;

  FespAppProvider({
    required this.data,
  });
}
