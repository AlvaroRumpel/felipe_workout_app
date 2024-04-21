part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  T when<T>({
    required T Function() authenticated,
    required T Function() loading,
    required T Function() unauthenticated,
  }) {
    if (this is Authenticated) {
      return authenticated();
    } else if (this is AuthLoading) {
      return loading();
    } else if (this is Unauthenticated) {
      return unauthenticated();
    }
    throw Exception('Unreachable');
  }

  T? maybeWhen<T>({
    T Function()? authenticated,
    T Function()? loading,
    T Function()? unauthenticated,
    required T? Function() orElse,
  }) {
    if (this is Authenticated && authenticated != null) {
      return authenticated();
    } else if (this is AuthLoading && loading != null) {
      return loading();
    } else if (this is Unauthenticated && unauthenticated != null) {
      return unauthenticated();
    } else {
      return orElse();
    }
  }

  T? whenOrNull<T>({
    T Function()? authenticated,
    T Function()? loading,
    T Function()? unauthenticated,
  }) {
    return maybeWhen(
      authenticated: authenticated,
      loading: loading,
      unauthenticated: unauthenticated,
      orElse: () => null,
    );
  }
}

final class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

final class Unauthenticated extends AuthState {}

final class AuthLoading extends AuthState {}
