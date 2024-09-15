import 'dart:async';

import 'package:bloc/bloc.dart';

class FWCubit<State> extends Cubit<State> {
  FWCubit(super.initialState);

  FutureOr<void> emitCatch({
    required State loading,
    required FutureOr<State> Function() success,
    required State Function(Object) error,
  }) async {
    emit(loading);
    try {
      final result = await success();
      emit(result);
    } catch (e) {
      emit(error(e));
    }
  }
}
