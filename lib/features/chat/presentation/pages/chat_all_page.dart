import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../shared/widgets/states/error_state_widget.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/entities/message_entity.dart';
import '../bloc/chat_rooms/chat_rooms_bloc.dart';
import '../widgets/chat_detail_widget.dart';
import '../widgets/chat_list_widget.dart';

class ChatAllPage extends StatefulWidget {
  const ChatAllPage({super.key});

  @override
  State<ChatAllPage> createState() => _ChatAllPageState();
}

class _ChatAllPageState extends State<ChatAllPage> {
  ChatRoom? _selectedChatRoom;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<ChatRoomsBloc>()..add(const ChatRoomsEvent.streamStarted());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox.shrink();
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              loaded: (value) {
                return Row(
                  children: [
                    ChatListWidget(
                      chatRooms: value,
                      onSelectChat: (chatRoom) {
                        setState(() {
                          _selectedChatRoom = chatRoom;
                        });
                      },
                    ),
                    VerticalDivider(width: 0),
                    if (_selectedChatRoom != null)
                      Expanded(
                        child: ChatDetailWidget(
                          chatRoom: _selectedChatRoom!,
                          messages: mockMessages,
                        ),
                      ),
                  ],
                );
              },
              error: (value) {
                return ErrorStateWidget(title: value);
              },
            );
          },
        ),
      ),
    );
  }
}
