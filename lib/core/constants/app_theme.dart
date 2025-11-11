import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
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
    chipTheme: ChipThemeData(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      backgroundColor: Colors.grey.shade100,
      labelStyle: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: Colors.black),
      labelPadding: EdgeInsets.zero,
    ),
    dividerTheme: DividerThemeData(color: Colors.grey.shade200),
  );
}
