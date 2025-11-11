import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:nocodeify_assignment/core/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/stream_chat_rooms.dart';
import '../../../domain/entities/chat_room.dart';

part 'chat_rooms_bloc.freezed.dart';
part 'chat_rooms_event.dart';
part 'chat_rooms_state.dart';

class ChatRoomsBloc extends Bloc<ChatRoomsEvent, ChatRoomsState> {
  final StreamChatRooms _streamChatRooms;

  ChatRoomsBloc({required StreamChatRooms streamChatRooms})
    : _streamChatRooms = streamChatRooms,
      super(const ChatRoomsState.initial()) {
    on<_StreamStarted>(_onStreamStarted, transformer: restartable());
  }

  Future<void> _onStreamStarted(
    _StreamStarted event,
    Emitter<ChatRoomsState> emit,
  ) async {
    emit(const ChatRoomsState.loading());

    final stream = _streamChatRooms.call(NoParams());

    await for (final (error, data) in stream) {
      if (error != null) {
        emit(ChatRoomsState.error(error.toString()));
      } else if (data != null) {
        emit(ChatRoomsState.loaded(data));
      }
    }
  }
}
