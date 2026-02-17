import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<MovieEntity> call(String imdbId) {
    return repository.getMovieDetail(imdbId);
  }
}
