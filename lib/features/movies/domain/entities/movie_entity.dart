import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String imdbID;
  final String title;
  final String year;
  final String poster;
  final String? plot;
  final String? genre;
  final String? director;
  final String? actors;
  final String? rated;
  final String? runtime;
  final String? imdbRating;
  final String? rottenTomatoesRating;
  final String? metacriticRating;

  const MovieEntity({
    required this.imdbID,
    required this.title,
    required this.year,
    required this.poster,
    this.plot,
    this.genre,
    this.director,
    this.actors,
    this.rated,
    this.runtime,
    this.imdbRating,
    this.rottenTomatoesRating,
    this.metacriticRating,
  });

  @override
  List<Object?> get props => [
    imdbID,
    title,
    year,
    poster,
    plot,
    genre,
    director,
    actors,
    rated,
    runtime,
    imdbRating,
    rottenTomatoesRating,
    metacriticRating,
  ];
}
