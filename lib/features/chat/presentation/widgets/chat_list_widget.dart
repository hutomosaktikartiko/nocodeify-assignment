import 'package:flutter/material.dart';

import '../../../../shared/widgets/form/search_form_widget.dart';
import '../../domain/entities/chat_room.dart';
import 'chat_item_widget.dart';

class ChatListWidget extends StatefulWidget {
  final List<ChatRoom> chatRooms;
  final ChatRoom? selectedChatRoom;
  final Function(String? query)? onSearchChat;
  final Function(ChatRoom chatRoom)? onSelectChat;

  const ChatListWidget({
    super.key,
    required this.chatRooms,
    this.selectedChatRoom,
    this.onSearchChat,
    this.onSelectChat,
  });

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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            spacing: 10,
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
              Expanded(
                child: ListView.builder(
                  itemCount: widget.chatRooms.length,
                  itemBuilder: (context, index) {
                    return ChatItemWidget(
                      name: widget.chatRooms[index].receiverName,
                      lastMessage: widget.chatRooms[index].lastMessage,
                      lastMessageTime: widget.chatRooms[index].lastMessageTime,
                      unreadCount: widget.chatRooms[index].unreadCount,
                      isSelected:
                          widget.selectedChatRoom?.id ==
                          widget.chatRooms[index].id,
                      onTap: () {
                        widget.onSelectChat?.call(widget.chatRooms[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
