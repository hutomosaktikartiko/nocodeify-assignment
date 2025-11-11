import 'package:get_it/get_it.dart';

import 'data/datasources/chat_remote_data_source.dart';
import 'data/repostories/chat_repository_impl.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/usecases/stream_chat_rooms.dart';
import 'domain/usecases/stream_messages.dart';
import 'presentation/bloc/chat_rooms/chat_rooms_bloc.dart';
import 'presentation/bloc/messages/message_bloc.dart';

void initChatFeature(GetIt sl) {
  // --- DATA SOURCE ---
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRoomRemoteDataSourceImpl(client: sl()),
  );

  // --- REPOSITORY ---
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(chatRemoteDataSource: sl()),
  );

  // --- USE CASE ---
  sl.registerLazySingleton<StreamChatRooms>(
    () => StreamChatRooms(chatRepository: sl()),
  );
  sl.registerLazySingleton<StreamMessages>(
    () => StreamMessages(chatRepository: sl()),
  );

  // --- BLOC ---
  sl.registerFactory<ChatRoomsBloc>(() {
    return ChatRoomsBloc(streamChatRooms: sl());
  });
  sl.registerFactoryParam<MessageBloc, String, int>(
    (String roomId, int currentUserId) => MessageBloc(
      streamMessages: sl(),
      roomId: roomId,
      currentUserId: currentUserId,
    ),
  );
}
