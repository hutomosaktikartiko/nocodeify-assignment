import 'package:get_it/get_it.dart';

import 'presentation/bloc/full_screen_loading_cubit.dart';

void initLoadingFeature(GetIt sl) {
  // --- BLOC ---
  sl.registerFactory<FullScreenLoadingCubit>(() {
    return FullScreenLoadingCubit();
  });
}
