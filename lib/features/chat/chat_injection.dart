import 'package:get_it/get_it.dart';

import 'data/datasources/chat_remote_data_source.dart';
import 'data/repostories/chat_repository_impl.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/usecases/stream_chat_rooms.dart';
import 'presentation/bloc/chat_rooms/chat_rooms_bloc.dart';

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

  // --- BLOC ---
  sl.registerFactory<ChatRoomsBloc>(() => ChatRoomsBloc(streamChatRooms: sl()));
}
