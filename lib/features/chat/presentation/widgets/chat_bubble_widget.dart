import 'package:flutter/material.dart';

import '../../../../shared/extensions/date/chat_date_extension.dart';

class ChatBubbleWidget extends StatelessWidget {
  final bool isMe;
  final String? message;
  final DateTime? time;

  const ChatBubbleWidget({
    super.key,
    required this.isMe,
    this.message,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth * 0.7;

        return Row(
          spacing: 10,
          mainAxisAlignment: isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isMe)
              Text(
                time?.bubbleTimeFormat(context) ?? "",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.green.shade100 : Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: isMe ? Radius.circular(10) : Radius.zero,
                      topRight: isMe ? Radius.zero : Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    message ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
            if (!isMe)
              Text(
                time?.bubbleTimeFormat(context) ?? "",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
          ],
        );
      },
    );
  }
}
