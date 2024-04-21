import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repositories/auth_repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(
    AuthRepository authRepository,
  )   : _authRepository = authRepository,
        super(AuthLoading()) {
    _authRepository.currentUser.listen(
      (User? user) {
        if (user == null) {
          emit(Unauthenticated());

          return;
        }

        emit(Authenticated(user));
      },
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
