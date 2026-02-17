import '../repositories/movie_repository.dart';

class IsFavourite {
  final MovieRepository repository;

  IsFavourite(this.repository);

  Future<bool> call(String imdbId) {
    return repository.isFavourite(imdbId);
  }
}
