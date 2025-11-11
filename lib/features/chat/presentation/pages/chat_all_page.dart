import 'package:flutter/material.dart';

import '../../domain/entities/message_entity.dart';
import '../widgets/chat_detail_widget.dart';
import '../widgets/chat_list_widget.dart';

class ChatAllPage extends StatelessWidget {
  const ChatAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          ChatListWidget(),
          VerticalDivider(width: 0),
          Expanded(child: ChatDetailWidget(messages: mockMessages)),
        ],
      ),
    );
  }
}
