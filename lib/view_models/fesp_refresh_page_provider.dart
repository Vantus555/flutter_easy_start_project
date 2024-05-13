import 'package:flutter/material.dart';

class FespRefreshPageProvider extends ChangeNotifier {
  var _value = UniqueKey();

  UniqueKey get value => _value;

  void refreshPage() {
    _value = UniqueKey();
    notifyListeners();
  }
}
