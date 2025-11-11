import '../../../../core/usecases/stream_usecase.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chat_room.dart';
import '../repositories/chat_repository.dart';

class StreamChatRooms implements StreamUseCase<List<ChatRoom>, NoParams> {
  final ChatRepository chatRepository;

  StreamChatRooms({required this.chatRepository});

  @override
  Stream<(Object?, List<ChatRoom>?)> call(NoParams params) {
    return chatRepository.streamChatRooms();
  }
}
