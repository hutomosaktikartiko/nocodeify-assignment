import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../shared/widgets/states/error_state_widget.dart';
import '../../domain/entities/chat_room.dart';
import '../bloc/chat_rooms/chat_rooms_bloc.dart';
import '../bloc/messages/message_bloc.dart';
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
                        child: BlocProvider(
                          key: ValueKey(_selectedChatRoom!.receiverId),
                          create: (context) {
                            return sl<MessageBloc>(
                              param1: _selectedChatRoom!.id,
                              param2: _selectedChatRoom!.receiverId,
                            )..add(const MessageEvent.streamStarted());
                          },
                          child: BlocBuilder<MessageBloc, MessageState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox.shrink(),
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                loaded: (messages) => ChatDetailWidget(
                                  chatRoom: _selectedChatRoom!,
                                  messages: messages,
                                ),
                                error: (error) =>
                                    ErrorStateWidget(title: error),
                              );
                            },
                          ),
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
