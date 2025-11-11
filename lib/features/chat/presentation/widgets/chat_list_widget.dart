import 'package:flutter/material.dart';

import '../../../../shared/widgets/form/search_form_widget.dart';
import 'chat_item_widget.dart';

class ChatListWidget extends StatefulWidget {
  final Function(String? query)? onSearchChat;

  const ChatListWidget({super.key, this.onSearchChat});

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            SearchFormWidget(
              controller: _searchController,
              hintText: 'Search',
              onChanged: (value) {
                widget.onSearchChat?.call(value);
              },
              onClear: () {
                widget.onSearchChat?.call(null);
              },
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: [
                        Chip(label: Text("Open Chats")),
                        Chip(label: Text("Closed Chats")),
                        Chip(label: Text("AI Paused")),
                      ],
                    ),
                  ),
                ),
                Chip(label: Icon(Icons.filter_list)),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatItemWidget(
                    name: "John Doe",
                    lastMessage: "Message $index",
                    lastMessageTime: DateTime.now().subtract(
                      Duration(hours: index),
                    ),
                    unreadCount: 10,
                    isSelected: false,
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
