import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

import 'unread_chat_count_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final String? name;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int? unreadCount;
  final bool isSelected;
  final Function()? onTap;

  const ChatItemWidget({
    super.key,
    this.name,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: isSelected ? Colors.grey.shade100 : Colors.transparent,
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(child: Text("A")),
            Expanded(
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Expanded(
                        child: Text(
                          name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (lastMessageTime != null)
                        Text(
                          format(lastMessageTime!),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lastMessage ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ),
                      if (unreadCount != null) UnreadChatCountWidget(count: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
