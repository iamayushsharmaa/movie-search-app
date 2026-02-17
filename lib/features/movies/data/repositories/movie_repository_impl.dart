import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/local/movie_local_datasource.dart';
import '../datasources/remote/movie_remote_datasource.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remote;
  final MovieLocalDataSource local;

  MovieRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    return await remote.searchMovies(query);
  }

  @override
  Future<MovieEntity> getMovieDetail(String imdbId) async {
    return await remote.getMovieDetail(imdbId);
  }

  @override
  Future<void> toggleFavourite(MovieEntity movie) async {
    final model = MovieModel.fromEntity(movie);
    await local.toggleFavourite(model);
  }

  @override
  Future<List<MovieEntity>> getFavourites() async {
    return await local.getFavourites();
  }

  @override
  Future<bool> isFavourite(String imdbId) async {
    return await local.isFavourite(imdbId);
  }
}
