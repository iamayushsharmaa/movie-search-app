import '../../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query);

  Future<MovieModel> getMovieDetail(String imdbId);
}
