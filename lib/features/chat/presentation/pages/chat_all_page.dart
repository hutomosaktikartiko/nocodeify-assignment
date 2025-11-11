import 'package:flutter/material.dart';

import '../widgets/chat_list_widget.dart';

class ChatAllPage extends StatelessWidget {
  const ChatAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Row(children: [ChatListWidget()]),
    );
  }
}
