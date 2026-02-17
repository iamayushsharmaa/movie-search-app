part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;

  SearchLoaded(this.movies);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
