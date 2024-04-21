import 'package:firebase_auth/firebase_auth.dart';

export 'auth_repository_impl.dart';

abstract interface class AuthRepository {
  Stream<User?> get currentUser;
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<UserCredential> createAndSingIn({
    required String email,
    required String password,
  });
  Future<void> passwordReset({required String email});
}
