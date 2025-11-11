part of 'chat_rooms_bloc.dart';

@freezed
abstract class ChatRoomsEvent with _$ChatRoomsEvent {
  const factory ChatRoomsEvent.streamStarted() = _StreamStarted;
}
