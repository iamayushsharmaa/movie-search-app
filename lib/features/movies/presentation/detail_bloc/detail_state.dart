part of 'detail_bloc.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final MovieEntity movie;

  DetailLoaded(this.movie);
}

class DetailError extends DetailState {
  final String message;

  DetailError(this.message);
}
