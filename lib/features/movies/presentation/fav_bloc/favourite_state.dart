part of 'favourite_bloc.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<MovieEntity> movies;

  FavouriteLoaded(this.movies);
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);
}