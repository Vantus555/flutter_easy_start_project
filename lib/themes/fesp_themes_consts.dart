import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const fespTextInputBorder = OutlineInputBorder();
const fespTextInputContentPadding = EdgeInsets.all(13);
final fespPositiveNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'\d*\.?\d*'));
final fespNumberFormat =
    FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*\.?\d*'));

final defaultBorderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);
