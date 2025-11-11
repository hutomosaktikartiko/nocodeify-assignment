import 'package:flutter/material.dart';

import '../../../../shared/widgets/button/icon_button_widget.dart';
import '../../../../shared/widgets/form/text_form_widget.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/entities/message_entity.dart';
import 'chat_bubble_widget.dart';

class ChatDetailWidget extends StatefulWidget {
  final ChatRoom chatRoom;
  final List<MessageEntity> messages;

  const ChatDetailWidget({
    super.key,
    required this.chatRoom,
    required this.messages,
  });

  @override
  State<ChatDetailWidget> createState() => _ChatDetailWidgetState();
}

class _ChatDetailWidgetState extends State<ChatDetailWidget> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(9),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(child: Text("A")),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatRoom.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Last seen at 10:00 AM",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Chip(
                label: Icon(Icons.more_vert, color: Colors.grey.shade500),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
        Divider(height: 0),
        Expanded(
          child: ListView.separated(
            itemCount: widget.messages.length,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            reverse: true,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 14);
            },
            itemBuilder: (context, index) {
              return ChatBubbleWidget(
                isMe: widget.messages[index].isMe,
                message: widget.messages[index].message,
                time: widget.messages[index].time,
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          color: Colors.white,
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  controller: _messageController,
                  hintText: 'Type something here...',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButtonWidget(
                          icon: Icons.attach_file,
                          width: 24,
                          height: 24,
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.grey.shade500,
                          onTap: () {
                            // TODO: attach file
                          },
                        ),
                        IconButtonWidget(
                          icon: Icons.emoji_emotions_outlined,
                          iconSize: 24,
                          height: 24,
                          width: 24,
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.grey.shade500,
                          onTap: () {
                            // TODO: send emoji
                          },
                        ),
                      ],
                    ),
                  ),
                  onChanged: (value) {
                    // reload
                    setState(() {});
                  },
                ),
              ),
              IconButtonWidget(
                icon: Icons.send,
                iconSize: 26,
                height: 45,
                width: 45,
                borderRadius: BorderRadius.circular(8),
                isDisabled: _messageController.text.isEmpty,
                onTap: () {
                  // TODO: send message
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
