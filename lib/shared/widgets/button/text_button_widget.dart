import 'package:flutter/material.dart';

import 'button_widget.dart';

class TextButtonWidget extends ButtonWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? textColor;
  final Function()? onTap;

  TextButtonWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.textColor,
    this.onTap,
  }) : super(
         child: Text(
           text,
           textAlign: textAlign,
           style: textStyle?.copyWith(color: textColor),
         ),
         onTap: onTap,
       );
}
