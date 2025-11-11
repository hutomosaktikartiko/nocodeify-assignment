import 'dart:async';

import '../../domain/entities/chat_room.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_room_model.dart';

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
}
