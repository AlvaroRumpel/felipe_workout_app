import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../repositories/auth_repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(RegisterInitial());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());

      await _authRepository.createAndSingIn(email: email, password: password);

      emit(RegisterLogged());
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
