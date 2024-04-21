import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/exception.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthServiceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException(stackTrace: e.stackTrace, error: e);
        case 'user-disabled':
          throw UserDisabledException(stackTrace: e.stackTrace, error: e);
        case 'invalid-credential':
        case 'user-not-found':
          throw UserNotFoundException(stackTrace: e.stackTrace, error: e);
        case 'wrong-password':
          throw WrongPasswordException(stackTrace: e.stackTrace, error: e);
        default:
          rethrow;
      }
    } catch (e) {
      throw CustomException(
        message: 'Erro ao fazer login, tente novamente',
        error: e,
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> createInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException(stackTrace: e.stackTrace, error: e);
        case 'email-already-in-use':
          throw EmailAlreadyInUseException(stackTrace: e.stackTrace, error: e);
        case 'operation-not-allowed':
          throw OperationNotAllowedException(
            stackTrace: e.stackTrace,
            error: e,
          );
        case 'weak-password':
          throw WeakPasswordException(stackTrace: e.stackTrace, error: e);
        default:
          rethrow;
      }
    } catch (e) {
      throw CustomException(
        message: 'Erro ao fazer o cadastro, tente novamente',
        error: e,
      );
    }
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        throw InvalidEmailException(stackTrace: e.stackTrace, error: e);
      }

      rethrow;
    } catch (e) {
      throw CustomException(
        message: 'Erro ao enviar a redefinição, tente novamente',
        error: e,
      );
    }
  }
}
