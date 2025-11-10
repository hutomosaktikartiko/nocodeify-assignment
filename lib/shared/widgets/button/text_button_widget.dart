import 'package:flutter/material.dart';

import 'button_widget.dart';

class TextButtonWidget extends ButtonWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? textColor;

  TextButtonWidget({
    super.key,
    super.onTap,
    super.backgroundColor,
    super.borderColor,
    super.borderRadius,
    super.padding,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.textColor,
  }) : super(
         child: Text(
           text,
           textAlign: textAlign,
           style: textStyle?.copyWith(color: textColor),
         ),
       );
}
