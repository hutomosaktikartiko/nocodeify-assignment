import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class SendMessage implements UseCase<void, SendMessageParams> {
  final ChatRepository chatRepository;

  SendMessage({required this.chatRepository});

  @override
  Future<(Object?, void)> call(SendMessageParams params) {
    return chatRepository.sendMessage(
      roomId: params.roomId,
      senderId: params.senderId,
      receiverId: params.receiverId,
      content: params.content,
    );
  }
}

class SendMessageParams extends Equatable {
  final String roomId;
  final int senderId;
  final int receiverId;
  final String content;

  const SendMessageParams({
    required this.roomId,
    required this.senderId,
    required this.receiverId,
    required this.content,
  });

  @override
  List<Object> get props => [roomId, senderId, receiverId, content];
}
