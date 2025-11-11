import '../entities/chat_room.dart';

abstract class ChatRepository {
  Stream<(Object?, List<ChatRoom>?)> streamChatRooms();
}
