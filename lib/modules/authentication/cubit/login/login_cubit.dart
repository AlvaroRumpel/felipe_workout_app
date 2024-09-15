import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../repositories/auth_repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      await _authRepository.signIn(email: email, password: password);

      emit(LoginLogged());
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      emit(LoginLoading());

      await _authRepository.passwordReset(email: email);

      emit(LoginInitial());
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
