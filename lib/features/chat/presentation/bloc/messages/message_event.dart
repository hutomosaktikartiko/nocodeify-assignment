part of 'message_bloc.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.streamStarted() = _StreamStarted;

  const factory MessageEvent.messageSent(String content) = _MessageSent;
}
