import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String roomId,
    required int senderId,
    required String content,
    required DateTime createdAt,
    required bool isMe,
  }) = _Message;
}
