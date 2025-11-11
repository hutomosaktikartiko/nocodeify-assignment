import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/chat_room_model.dart';
import '../models/message_model.dart';

abstract class ChatRemoteDataSource {
  Stream<List<ChatRoomModel>> streamChatRooms();
  Stream<List<MessageModel>> streamMessages(String roomId);
}

class ChatRoomRemoteDataSourceImpl implements ChatRemoteDataSource {
  final SupabaseClient client;
  RealtimeChannel? _chatChannel;

  ChatRoomRemoteDataSourceImpl({required this.client});

  @override
  Stream<List<ChatRoomModel>> streamChatRooms() {
    final controller = StreamController<List<ChatRoomModel>>.broadcast();

    Future<void> fetchDataAndPush() async {
      try {
        final chatList = await _fetchChatListData();
        if (!controller.isClosed) {
          controller.add(chatList);
        }
      } catch (e) {
        if (!controller.isClosed) {
          controller.addError(e);
        }
      }
    }

    controller.onListen = () {
      fetchDataAndPush();

      _chatChannel = client
          .channel('public:messages')
          .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'messages',
            callback: (payload) {
              fetchDataAndPush();
            },
          )
          .subscribe();
    };

    controller.onCancel = () {
      if (_chatChannel != null) {
        client.removeChannel(_chatChannel!);
        _chatChannel = null;
      }
    };

    return controller.stream;
  }

  Future<List<ChatRoomModel>> _fetchChatListData() async {
    try {
      final pov1DataFuture = client.rpc(
        'get_chat_list_items',
        params: {'p_viewer_id': 1},
      );
      final pov2DataFuture = client.rpc(
        'get_chat_list_items',
        params: {'p_viewer_id': 2},
      );

      final results = await Future.wait([pov1DataFuture, pov2DataFuture]);

      final pov1List = results[0] as List;
      final pov2List = results[1] as List;

      final chatListPov1 = pov1List.map((json) {
        return ChatRoomModel.fromJson(json);
      });
      final chatListPov2 = pov2List.map((json) {
        return ChatRoomModel.fromJson(json);
      });

      final chatList = [...chatListPov1, ...chatListPov2];

      return chatList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<MessageModel>> streamMessages(String roomId) {
    try {
      final stream = client
          .from('messages')
          .stream(primaryKey: ['id'])
          .eq('room_id', roomId)
          .order('created_at', ascending: true);

      return stream.map((listOfMaps) {
        return listOfMaps.map((json) {
          try {
            return MessageModel.fromJson(json);
          } catch (e) {
            rethrow;
          }
        }).toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}
