import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String? title, description;
  final EdgeInsetsGeometry? padding;

  const ErrorStateWidget({
    super.key,
    this.title,
    this.description,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 40, color: Colors.red.withValues(alpha: 0.5)),
          const SizedBox(height: 20),
          Text(title ?? 'Error', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 5),
          Text(
            description ?? 'Something went wrong',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
