import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/message.dart';
import '../../../domain/usecases/send_message.dart';
import '../../../domain/usecases/stream_messages.dart';

part 'message_bloc.freezed.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBlocParams {
  final String roomId;
  final int senderId;
  final int receiverId;

  const MessageBlocParams({
    required this.roomId,
    required this.senderId,
    required this.receiverId,
  });
}

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final StreamMessages _streamMessages;
  final SendMessage _sendMessage;

  final String roomId;
  final int senderId;
  final int receiverId;

  MessageBloc({
    required StreamMessages streamMessages,
    required SendMessage sendMessage,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
  }) : _streamMessages = streamMessages,
       _sendMessage = sendMessage,
       super(const MessageState.initial()) {
    on<_StreamStarted>(_onStreamStarted, transformer: restartable());

    on<_MessageSent>(_onMessageSent, transformer: restartable());
  }

  Future<void> _onStreamStarted(
    _StreamStarted event,
    Emitter<MessageState> emit,
  ) async {
    emit(const MessageState.loading());

    final stream = _streamMessages.call(
      MessageParams(roomId: roomId, currentUserId: senderId),
    );

    await for (final (error, data) in stream) {
      if (error != null) {
        emit(MessageState.error(error.toString()));
      } else if (data != null) {
        emit(MessageState.loaded(data));
      }
    }
  }

  Future<void> _onMessageSent(
    _MessageSent event,
    Emitter<MessageState> emit,
  ) async {
    if (state is! _Loaded) return;

    final currentState = state as _Loaded;

    emit(currentState.copyWith(isSending: true, sendError: null));

    final params = SendMessageParams(
      roomId: roomId,
      senderId: senderId,
      receiverId: receiverId,
      content: event.content,
    );

    final (error, _) = await _sendMessage.call(params);

    if (state is! _Loaded) return;
    final stateAfterSend = state as _Loaded;

    emit(
      stateAfterSend.copyWith(isSending: false, sendError: error?.toString()),
    );
  }
}
