// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _ChatRoomModel(
      roomId: json['room_id'] as String,
      senderId: (json['sender_id'] as num).toInt(),
      receiverId: (json['receiver_id'] as num).toInt(),
      receiverName: json['receiver_name'] as String?,
      latestMessageContent: json['latest_message_content'] as String?,
      latestMessageTimestamp: json['latest_message_timestamp'] == null
          ? null
          : DateTime.parse(json['latest_message_timestamp'] as String),
      unreadCount: (json['unread_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChatRoomModelToJson(_ChatRoomModel instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'sender_id': instance.senderId,
      'receiver_id': instance.receiverId,
      'receiver_name': instance.receiverName,
      'latest_message_content': instance.latestMessageContent,
      'latest_message_timestamp': instance.latestMessageTimestamp
          ?.toIso8601String(),
      'unread_count': instance.unreadCount,
    };
