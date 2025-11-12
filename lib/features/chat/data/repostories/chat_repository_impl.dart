import 'dart:async';

import '../../domain/entities/chat_room.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_room_model.dart';
import '../models/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({required this.chatRemoteDataSource});

  @override
  Stream<(Object?, List<ChatRoom>?)> streamChatRooms() {
    final modelStream = chatRemoteDataSource.streamChatRooms();

    return modelStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (List<ChatRoomModel> models, EventSink sink) {
          final entities = models.map((model) => model.toEntity()).toList();
          sink.add((null, entities));
        },
        handleError: (error, stackTrace, sink) {
          sink.add((error, null));
        },
      ),
    );
  }

  @override
  Stream<(Object?, List<Message>?)> streamMessages({
    required String roomId,
    required int currentUserId,
  }) {
    final modelStream = chatRemoteDataSource.streamMessages(roomId);

    return modelStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (List<MessageModel> models, EventSink sink) {
          final entities = models
              .map((model) => model.toEntity(currentUserId: currentUserId))
              .toList();
          sink.add((null, entities));
        },
        handleError: (error, stackTrace, sink) {
          sink.add((error, null));
        },
      ),
    );
  }

  @override
  Future<(Object?, void)> sendMessage({
    required String roomId,
    required int senderId,
    required int receiverId,
    required String content,
  }) async {
    try {
      await chatRemoteDataSource.sendMessage(
        roomId: roomId,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
      );

      return (null, null);
    } catch (e) {
      return (e, null);
    }
  }

  @override
  Future<(Object?, void)> markMessagesAsRead({
    required String roomId,
    required int currentUserId,
  }) async {
    try {
      await chatRemoteDataSource.markMessagesAsRead(
        roomId: roomId,
        currentUserId: currentUserId,
      );
    } catch (e) {
      return (e, null);
    }
    return (null, null);
  }
}
