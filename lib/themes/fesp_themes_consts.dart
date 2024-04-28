// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

const FESP_TEXT_INPUT_BORDER = OutlineInputBorder();
const FESP_TEXT_INPUT_CONTENT_PADDING = EdgeInsets.all(13);

const double SLIDE_PANEL_BORDER_RADIUS = 24;
final FESP_BORDER_RADIUS = BorderRadius.circular(5);
final FESP_SHAPE = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);

const double FESP_MATERIAL_ELEVATION = 6;
const FESP_TILE_PADDING = EdgeInsets.all(5);
const FESP_CHILDREN_PADDING = EdgeInsets.all(10);

Color FESP_SHADOW_COLOR(context) => Theme.of(context).primaryColor;
Color FESP_ACTIVE_COLOR(context) => Theme.of(context).focusColor;
Color FESP_EXPANSION_COLOR(context) => FESP_ACTIVE_COLOR(context);
Color? FESP_TAB_BAR_COLOR(context) =>
    Theme.of(context).appBarTheme.backgroundColor;
