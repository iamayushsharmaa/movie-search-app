import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> searchMovies(String query);

  Future<MovieEntity> getMovieDetail(String imdbId);

  Future<void> toggleFavourite(MovieEntity movie);

  Future<List<MovieEntity>> getFavourites();

  Future<bool> isFavourite(String imdbId);
}
