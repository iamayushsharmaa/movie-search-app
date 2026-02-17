import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetFavourites {
  final MovieRepository repository;

  GetFavourites(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getFavourites();
  }
}
