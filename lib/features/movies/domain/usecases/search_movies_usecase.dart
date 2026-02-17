
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class SearchMoviesUsecase {
  final MovieRepository repository;

  SearchMoviesUsecase(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchMovies(query);
  }
}
