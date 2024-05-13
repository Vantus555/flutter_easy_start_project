import 'package:flutter/material.dart';

class FespValueChangeProvider<T> extends ChangeNotifier {
  late T _value;

  FespValueChangeProvider({
    required T value,
  }) {
    _value = value;
  }

  T getValue() {
    return _value;
  }

  void setValue(T newValue) {
    _value = newValue;
    notifyListeners();
  }
}
