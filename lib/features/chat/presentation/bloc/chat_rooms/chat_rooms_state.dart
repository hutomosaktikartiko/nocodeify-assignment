part of 'chat_rooms_bloc.dart';

@freezed
abstract class ChatRoomsState with _$ChatRoomsState {
  const factory ChatRoomsState.initial() = _Initial;

  const factory ChatRoomsState.loading() = _Loading;

  const factory ChatRoomsState.loaded(List<ChatRoom> chatRooms) = _Loaded;

  const factory ChatRoomsState.error(String message) = _Error;
}
