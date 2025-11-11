import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/message.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MessageModel({
    required String id,
    required String roomId,
    required int senderId,
    String? content,
    required DateTime createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Message toEntity({required int currentUserId}) => Message(
    id: id,
    roomId: roomId,
    senderId: senderId,
    content: content ?? '',
    createdAt: createdAt,
    isMe: senderId == currentUserId,
  );
}
