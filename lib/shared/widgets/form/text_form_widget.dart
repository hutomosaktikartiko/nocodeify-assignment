import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly, autoFocus;
  final String? initialValue;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function()? onClear;

  const TextFormFieldWidget({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.textAlign,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.autoFocus,
    this.initialValue,
    this.backgroundColor,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
    this.borderRadius,
    this.contentPadding,
    this.onTap,
    this.onEditingComplete,
    this.onClear,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.keyboardType == TextInputType.visiblePassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(widget.title!, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 5),
        ],
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          textAlign: widget.textAlign ?? TextAlign.start,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly ?? false,
          focusNode: widget.focusNode,
          onChanged: _onChange,
          maxLines: widget.maxLines,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          obscureText: _obscureText,
          autofocus: widget.autoFocus ?? false,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.black),
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: fillColor ?? Colors.white,
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(),
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: _buildOutlineInputBorder(borderColor: Colors.grey.shade500),
            enabledBorder: _buildOutlineInputBorder(
              borderColor: Colors.grey.shade300,
            ),
            focusedBorder: _buildOutlineInputBorder(borderColor: Colors.black),
            errorBorder: _buildOutlineInputBorder(borderColor: Colors.red),
            focusedErrorBorder: _buildOutlineInputBorder(
              borderColor: Colors.red,
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }

  Color? get fillColor {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor;
    }

    if (widget.readOnly == true) {
      return Colors.grey.shade100;
    }

    return null;
  }

  Widget? _buildSuffixIcon() {
    if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey.shade500,
        ),
      );
    }

    if (widget.onClear != null && widget.controller?.text.isNotEmpty == true) {
      return GestureDetector(
        onTap: () {
          // close keyboard
          FocusScope.of(context).unfocus();

          // clear text
          widget.controller?.clear();

          // reload
          setState(() {});

          // callback
          widget.onClear!();
        },
        child: const Icon(Icons.close, color: Colors.black),
      );
    }

    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    }

    return null;
  }

  OutlineInputBorder _buildOutlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    );
  }

  void _onChange(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }

    // reload
    setState(() {});
  }
}
