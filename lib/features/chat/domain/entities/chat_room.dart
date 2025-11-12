import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';

@freezed
abstract class ChatRoom with _$ChatRoom {
  const ChatRoom._();
  const factory ChatRoom({
    required String id,
    required int senderId,
    required int receiverId,
    required String receiverName,
    required String? lastMessage,
    required DateTime? lastMessageTime,
    required int unreadCount,
  }) = _ChatRoom;
}
