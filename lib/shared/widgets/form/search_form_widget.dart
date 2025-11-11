import 'package:flutter/material.dart';

import '../../../core/utils/debouncer.dart';
import 'text_form_widget.dart';

class SearchFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText, title;
  final Function()? onClear;
  final Function(String? query)? onChanged;
  final bool? isDisableDebouncer;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autoFocus;
  final BorderRadius? borderRadius;

  const SearchFormWidget({
    super.key,
    this.controller,
    this.hintText,
    this.title,
    this.onClear,
    this.onChanged,
    this.isDisableDebouncer,
    this.contentPadding,
    this.autoFocus,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      hintText: hintText,
      title: title,
      onClear: onClear,
      contentPadding: contentPadding,
      autoFocus: autoFocus,
      borderRadius: borderRadius,
      suffixIcon: Icon(Icons.search, color: Colors.grey.shade500),
      onChanged: (value) {
        if (onChanged == null) {
          return;
        }

        if (isDisableDebouncer == true) {
          onChanged!(value);

          return;
        }

        // debounce for 0.8 seconds
        final debouncer = Debouncer(milliseconds: 800);

        debouncer.run(() {
          if (value == controller?.text) {
            // do handle change when bouncer value same with text controller
            onChanged!(value);
          }
        });
      },
    );
  }
}
