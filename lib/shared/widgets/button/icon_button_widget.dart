import 'package:flutter/material.dart';

import 'button_widget.dart';

class IconButtonWidget extends ButtonWidget {
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final TextDirection? direction;

  IconButtonWidget({
    super.key,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.direction,
  }) : super(
         child: Icon(
           icon,
           color: iconColor,
           size: iconSize,
           textDirection: direction,
         ),
       );
}
