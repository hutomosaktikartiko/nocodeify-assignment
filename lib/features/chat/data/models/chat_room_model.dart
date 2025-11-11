import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_room.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
abstract class ChatRoomModel with _$ChatRoomModel {
  const ChatRoomModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatRoomModel({
    required String roomId,
    int? otherParticipantId,
    String? otherParticipantName,
    String? latestMessageContent,
    DateTime? latestMessageTimestamp,
    int? unreadCount,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  ChatRoom toEntity() => ChatRoom(
    id: roomId,
    name: otherParticipantName ?? '',
    lastMessage: latestMessageContent,
    lastMessageTime: latestMessageTimestamp,
    unreadCount: unreadCount ?? 0,
  );
}
