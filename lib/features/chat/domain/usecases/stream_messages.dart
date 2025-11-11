import 'package:equatable/equatable.dart';

import '../../../../core/usecases/stream_usecase.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class StreamMessages implements StreamUseCase<List<Message>, MessageParams> {
  final ChatRepository chatRepository;

  StreamMessages({required this.chatRepository});

  @override
  Stream<(Object?, List<Message>?)> call(MessageParams params) {
    return chatRepository.streamMessages(
      roomId: params.roomId,
      currentUserId: params.currentUserId,
    );
  }
}

class MessageParams extends Equatable {
  final String roomId;
  final int currentUserId;

  const MessageParams({required this.roomId, required this.currentUserId});

  @override
  List<Object> get props => [roomId, currentUserId];
}
