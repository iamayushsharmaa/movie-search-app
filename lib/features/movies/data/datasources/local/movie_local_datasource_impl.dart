import 'package:hive/hive.dart';

import '../../models/movie_model.dart';
import 'movie_local_datasource.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  static const String boxName = 'favourites';

  Future<Box<MovieModel>> _openBox() async {
    return await Hive.openBox<MovieModel>(boxName);
  }

  @override
  Future<void> toggleFavourite(MovieModel movie) async {
    final box = await _openBox();

    if (box.containsKey(movie.imdbID)) {
      await box.delete(movie.imdbID);
    } else {
      await box.put(movie.imdbID, movie);
    }
  }

  @override
  Future<List<MovieModel>> getFavourites() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<bool> isFavourite(String imdbID) async {
    final box = await _openBox();
    return box.containsKey(imdbID);
  }
}
