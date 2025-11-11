import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/button/text_button_widget.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Chats", style: Theme.of(context).textTheme.titleLarge),
        Text(
          "Respond to messages, set up automation, and more. Automation create message ads",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.grey.shade200,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  labelPadding: EdgeInsets.symmetric(horizontal: 4),
                  tabs: [
                    _TabBarItem(
                      text: 'All',
                      onTap: () {
                        if (_tabController.index == 0) {
                          return;
                        }

                        context.go('/chat/all');
                      },
                      isSelected: _tabController.index == 0,
                    ),
                    _TabBarItem(
                      text: 'Instagram',
                      onTap: () {
                        if (_tabController.index == 1) {
                          return;
                        }

                        context.go('/chat/instagram');
                      },
                      isSelected: _tabController.index == 1,
                    ),
                  ],
                ),

                Expanded(child: widget.child),
              ],
            ),
          ),
        ),
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

class _TabBarItem extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isSelected;

  const _TabBarItem({
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      text: text,
      backgroundColor: isSelected ? Colors.white : Colors.grey.shade100,
      borderColor: isSelected ? Colors.blue : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(6),
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: isSelected ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
    );
  }
}
