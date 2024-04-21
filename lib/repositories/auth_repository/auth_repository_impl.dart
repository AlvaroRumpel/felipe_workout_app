import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/exception.dart';
import '../../services/auth_service/auth_service.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({required AuthService authService})
      : _authService = authService;

  @override
  Stream<User?> get currentUser => _authService.user;

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on CustomException catch (e) {
      throw AuthException(
        message: e.message,
        stackTrace: e.stackTrace,
        error: e.error,
      );
    }
  }

  @override
  Future<void> signOut() async => await _authService.signOut();

  @override
  Future<UserCredential> createAndSingIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.createInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on CustomException catch (e) {
      throw AuthException(
        message: e.message,
        stackTrace: e.stackTrace,
        error: e.error,
      );
    }
  }

  @override
  Future<void> passwordReset({required String email}) async {
    try {
      return await _authService.sendPasswordReset(email);
    } on CustomException catch (e) {
      throw AuthException(
        message: e.message,
        stackTrace: e.stackTrace,
        error: e.error,
      );
    }
  }
}
