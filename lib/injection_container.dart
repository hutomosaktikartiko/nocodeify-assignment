import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/chat/chat_injection.dart';
import 'features/loading/loading_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --- CORE ---
  sl.registerSingleton<SupabaseClient>(Supabase.instance.client);

  // --- FEATURES ---
  initChatFeature(sl);
  initLoadingFeature(sl);
}
