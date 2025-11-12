import '../entities/chat_room.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  Stream<(Object?, List<ChatRoom>?)> streamChatRooms();
  Stream<(Object?, List<Message>?)> streamMessages({
    required String roomId,
    required int currentUserId,
  });
  Future<(Object?, void)> sendMessage({
    required String roomId,
    required int senderId,
    required int receiverId,
    required String content,
  });
}
