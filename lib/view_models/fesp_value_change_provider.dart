import 'package:flutter/material.dart';

class FespValueChangeProvider<T> extends ChangeNotifier {
  T value;

  FespValueChangeProvider({required this.value});

  T getValue() {
    return value;
  }

  void setValue(T newValue) {
    value = newValue;
    notifyListeners();
  }
}
