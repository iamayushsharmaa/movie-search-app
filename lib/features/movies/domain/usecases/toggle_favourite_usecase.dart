import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class ToggleFavourite {
  final MovieRepository repository;

  ToggleFavourite(this.repository);

  Future<void> call(MovieEntity movie) {
    return repository.toggleFavourite(movie);
  }
}
