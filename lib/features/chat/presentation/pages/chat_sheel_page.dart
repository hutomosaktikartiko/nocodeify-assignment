import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatSheelPage extends StatefulWidget {
  final Widget child;

  const ChatSheelPage({super.key, required this.child});

  @override
  State<ChatSheelPage> createState() => _ChatSheelPageState();
}

class _ChatSheelPageState extends State<ChatSheelPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = _calculateTabIndex(context);
    if (index != _tabController.index) {
      _tabController.animateTo(index);
    }

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Instagram'),
          ],
          onTap: (value) {
            if (value == 0) {
              context.go('/chat/all');
            } else {
              context.go('/chat/instagram');
            }
          },
        ),

        Expanded(child: widget.child),
      ],
    );
  }

  int _calculateTabIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.contains('/chat/instagram')) {
      return 1;
    }

    return 0;
  }
}
