part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeData extends HomeState {}

final class HomeEmpty extends HomeState {}

final class HomeError extends HomeState {}
