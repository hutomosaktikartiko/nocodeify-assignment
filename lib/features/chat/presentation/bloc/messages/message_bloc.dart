import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/message.dart';
import '../../../domain/usecases/stream_messages.dart';

part 'message_bloc.freezed.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final StreamMessages _streamMessages;

  final String roomId;
  final int currentUserId;

  MessageBloc({
    required StreamMessages streamMessages,
    required this.roomId,
    required this.currentUserId,
  }) : _streamMessages = streamMessages,
       super(const MessageState.initial()) {
    on<_StreamStarted>(_onStreamStarted, transformer: restartable());

    // TODO: Message Sent event
  }

  Future<void> _onStreamStarted(
    _StreamStarted event,
    Emitter<MessageState> emit,
  ) async {
    emit(const MessageState.loading());

    final stream = _streamMessages.call(
      MessageParams(roomId: roomId, currentUserId: currentUserId),
    );

    await for (final (error, data) in stream) {
      if (error != null) {
        emit(MessageState.error(error.toString()));
      } else if (data != null) {
        emit(MessageState.loaded(data));
      }
    }
  }
}
