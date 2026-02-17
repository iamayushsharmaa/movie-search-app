import 'package:hive/hive.dart';

import '../../domain/entities/movie_entity.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends MovieEntity {
  @HiveField(0)
  final String imdbID;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String year;

  @HiveField(3)
  final String poster;

  @HiveField(4)
  final String? plot;

  @HiveField(5)
  final String? genre;

  @HiveField(6)
  final String? director;

  @HiveField(7)
  final String? actors;

  @HiveField(11)
  final String? rated;

  @HiveField(12)
  final String? runtime;

  @HiveField(8)
  final String? imdbRating;

  @HiveField(9)
  final String? rottenTomatoesRating;

  @HiveField(10)
  final String? metacriticRating;

  MovieModel({
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
    this.metacriticRating,
    this.rottenTomatoesRating,
  }) : super(
         imdbID: imdbID,
         title: title,
         year: year,
         poster: poster,
         plot: plot,
         genre: genre,
         director: director,
         actors: actors,
         rated: rated,
         runtime: runtime,
         imdbRating: imdbRating,
         rottenTomatoesRating: rottenTomatoesRating,
         metacriticRating: metacriticRating,
       );

  factory MovieModel.fromSearchJson(Map<String, dynamic> json) {
    return MovieModel(
      imdbID: json['imdbID'] ?? '',
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      poster: json['Poster'] ?? '',
    );
  }

  factory MovieModel.fromDetailJson(Map<String, dynamic> json) {
    final ratings = json['Ratings'] as List?;

    String? rotten;
    String? meta;

    if (ratings != null) {
      for (final rating in ratings) {
        if (rating['Source'] == 'Rotten Tomatoes') {
          rotten = rating['Value'];
        }
        if (rating['Source'] == 'Metacritic') {
          meta = rating['Value'];
        }
      }
    }

    return MovieModel(
      imdbID: json['imdbID'] ?? '',
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      poster: json['Poster'] ?? '',
      plot: json['Plot'],
      genre: json['Genre'],
      director: json['Director'],
      actors: json['Actors'],
      rated: json['Rated'],
      runtime: json['Runtime'],
      imdbRating: json['imdbRating'],
      rottenTomatoesRating: rotten,
      metacriticRating: meta,
    );
  }

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      imdbID: entity.imdbID,
      title: entity.title,
      year: entity.year,
      poster: entity.poster,
      plot: entity.plot,
      genre: entity.genre,
      director: entity.director,
      actors: entity.actors,
      rated: entity.rated,
      runtime: entity.runtime,
      imdbRating: entity.imdbRating,
      rottenTomatoesRating: entity.rottenTomatoesRating,
      metacriticRating: entity.metacriticRating,
    );
  }
}
