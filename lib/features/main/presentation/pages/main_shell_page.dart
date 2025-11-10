import 'package:flutter/material.dart';

import '../widgets/sidebar_body_widget.dart';
import '../widgets/sidebar_widget.dart';

class MainShellPage extends StatelessWidget {
  final Widget child;

  const MainShellPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarWidget(),
          SidebarBodyWidget(child: child),
        ],
      ),
    );
  }
}
