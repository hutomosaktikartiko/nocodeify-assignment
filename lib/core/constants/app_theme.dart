import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.grey.shade100,
  listTileTheme: ListTileThemeData(
    selectedColor: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    iconColor: Colors.black,
  ),
  dividerColor: Colors.grey.shade200,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),
);
