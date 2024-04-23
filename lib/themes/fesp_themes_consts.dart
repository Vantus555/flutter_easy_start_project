// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

const FESP_TEXT_INPUT_BORDER = OutlineInputBorder();
const FESP_TEXT_INPUT_CONTENT_PADDING = EdgeInsets.all(13);

final FESP_BORDER_RADIUS = BorderRadius.circular(5);
final FESP_SHAPE = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);

const double FESP_MATERIAL_ELEVATION = 6;
const FESP_TILE_PADDING = EdgeInsets.all(5);
const FESP_CHILDREN_PADDING = EdgeInsets.all(10);

FESP_SHADOW_COLOR(ctx) => Theme.of(ctx).primaryColor;
FESP_EXPANSION_COLOR(ctx) => Theme.of(ctx).focusColor;
TAB_BAR_DEFAULT_COLOR(ctx) => Theme.of(ctx).appBarTheme.backgroundColor;
