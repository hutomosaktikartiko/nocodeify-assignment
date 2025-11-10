import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? borderColor, backgroundColor, loadingColor;
  final Function()? onTap;
  final Widget? child;
  final double? elevattion;
  final bool? isLoading, isDisabled;
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  const ButtonWidget({
    super.key,
    this.borderColor,
    this.backgroundColor,
    this.loadingColor,
    this.onTap,
    this.child,
    this.elevattion,
    this.isLoading,
    this.isDisabled,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              side: _buildBorderSide,
            ),
          ),
          padding: WidgetStateProperty.all(padding ?? EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(_builBackgroundColor),
          elevation: WidgetStateProperty.all(elevattion ?? 0),
        ),
        child: _buildChild,
      ),
    );
  }

  void _onPressed() {
    if (isDisabled == true) {
      return;
    }

    if (isLoading == true) {
      return;
    }

    onTap?.call();
  }

  Widget? get _buildChild {
    if (isLoading == true) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: loadingColor, strokeWidth: 2),
      );
    }

    return child;
  }

  Color? get _builBackgroundColor {
    if (isDisabled == true) {
      return Colors.grey.withValues(alpha: 0.5);
    }

    return backgroundColor;
  }

  BorderSide get _buildBorderSide {
    if (borderColor == null) {
      return BorderSide.none;
    }

    return BorderSide(color: borderColor!);
  }
}
