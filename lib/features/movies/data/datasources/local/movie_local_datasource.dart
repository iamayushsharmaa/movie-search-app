import 'package:hive/hive.dart';

import '../../models/movie_model.dart';
abstract class MovieLocalDataSource {
  Future<void> toggleFavourite(MovieModel movie);
  Future<List<MovieModel>> getFavourites();
  Future<bool> isFavourite(String imdbID);
}