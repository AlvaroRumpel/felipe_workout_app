import 'package:firebase_auth/firebase_auth.dart';

export 'auth_service_impl.dart';

abstract interface class AuthService {
  Stream<User?> get user;
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<UserCredential> createInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordReset(String email);
}
