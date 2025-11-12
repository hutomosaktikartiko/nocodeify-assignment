import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/loading/presentation/bloc/full_screen_loading_cubit.dart';

extension LoadingContextExtension on BuildContext {
  void showFullScreenLoading({String? message}) {
    BlocProvider.of<FullScreenLoadingCubit>(this).show(message: message);
  }

  void hideFullScreenLoading() {
    BlocProvider.of<FullScreenLoadingCubit>(this).hide();
  }
}
