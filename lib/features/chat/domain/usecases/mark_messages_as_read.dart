import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class MarkMessagesAsRead implements UseCase<void, MarkMessagesAsReadParams> {
  final ChatRepository chatRepository;

  MarkMessagesAsRead({required this.chatRepository});

  @override
  Future<(Object?, void)> call(MarkMessagesAsReadParams params) {
    return chatRepository.markMessagesAsRead(
      roomId: params.roomId,
      currentUserId: params.currentUserId,
    );
  }
}

class MarkMessagesAsReadParams extends Equatable {
  final String roomId;
  final int currentUserId;

  const MarkMessagesAsReadParams({
    required this.roomId,
    required this.currentUserId,
  });

  @override
  List<Object> get props => [roomId, currentUserId];
}
