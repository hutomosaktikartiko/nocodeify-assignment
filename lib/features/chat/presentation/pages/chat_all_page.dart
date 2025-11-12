import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../shared/extensions/context/loading_context_extension.dart';
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
                      selectedChatRoom: _selectedChatRoom,
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
                                param1: MessageBlocParams(
                                  roomId: _selectedChatRoom!.id,
                                  senderId: _selectedChatRoom!.senderId,
                                  receiverId: _selectedChatRoom!.receiverId,
                                ),
                              )
                              ..add(const MessageEvent.streamStarted())
                              ..add(const MessageEvent.markMessagesAsRead());
                          },
                          child: BlocConsumer<MessageBloc, MessageState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                loaded: (messages, isSending, sendError) {
                                  // hide loading
                                  context.hideFullScreenLoading();

                                  if (sendError != null) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: Text(sendError),
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                        ),
                                      );
                                  }
                                },
                                error: (error) {
                                  // hide loading
                                  context.hideFullScreenLoading();
                                },
                                orElse: () {},
                              );
                            },
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox.shrink(),
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                loaded: (messages, isSending, sendError) {
                                  return ChatDetailWidget(
                                    chatRoom: _selectedChatRoom!,
                                    messages: messages,
                                    onSendMessage: (message) {
                                      // show loading
                                      context.showFullScreenLoading();

                                      // send message
                                      context.read<MessageBloc>().add(
                                        MessageEvent.messageSent(message),
                                      );
                                    },
                                  );
                                },
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
