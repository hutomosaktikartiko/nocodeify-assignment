part of 'message_bloc.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;

  const factory MessageState.loading() = _Loading;

  const factory MessageState.loaded(
    List<Message> messages, {
    @Default(false) bool isSending,
    String? sendError,
  }) = _Loaded;

  const factory MessageState.error(String message) = _Error;
}
