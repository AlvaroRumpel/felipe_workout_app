part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<WorkoutModel> workouts) data,
    required T Function() empty,
    required T Function(String message) error,
  }) {
    if (this is HomeInitial) {
      return initial();
    } else if (this is HomeLoading) {
      return loading();
    } else if (this is HomeData) {
      return data((this as HomeData).workouts);
    } else if (this is HomeEmpty) {
      return empty();
    } else if (this is HomeError) {
      return error((this as HomeError).message);
    }
    throw Exception('Unreachable');
  }

  T? maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(List<WorkoutModel> workouts)? data,
    T Function()? empty,
    T Function(String message)? error,
    required T? Function() orElse,
  }) {
    if (this is HomeInitial && initial != null) {
      return initial();
    } else if (this is HomeLoading && loading != null) {
      return loading();
    } else if (this is HomeData && data != null) {
      return data((this as HomeData).workouts);
    } else if (this is HomeEmpty && empty != null) {
      return empty();
    } else if (this is HomeError && error != null) {
      return error((this as HomeError).message);
    } else {
      return orElse();
    }
  }

  T? whenOrNull<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(List<WorkoutModel> workouts)? data,
    T Function()? empty,
    T Function(String message)? error,
  }) {
    return maybeWhen(
      initial: initial,
      loading: loading,
      data: data,
      empty: empty,
      error: error,
      orElse: () => null,
    );
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeData extends HomeState {
  final List<WorkoutModel> workouts;

  HomeData({required this.workouts});
}

final class HomeEmpty extends HomeState {}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
