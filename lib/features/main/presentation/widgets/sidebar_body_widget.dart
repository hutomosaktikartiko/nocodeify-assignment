import 'package:flutter/material.dart';

class SidebarBodyWidget extends StatelessWidget {
  final Widget child;

  const SidebarBodyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: child);
  }
}
