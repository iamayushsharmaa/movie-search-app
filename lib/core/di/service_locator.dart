import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviesearch/features/movies/data/datasources/local/movie_local_datasource.dart';
import 'package:moviesearch/features/movies/data/datasources/local/movie_local_datasource_impl.dart';
import 'package:moviesearch/features/movies/data/datasources/remote/movie_remote_datasource.dart';
import 'package:moviesearch/features/movies/data/datasources/remote/movie_remote_datasource_impl.dart';
import 'package:moviesearch/features/movies/domain/usecases/get_favourite_usecase.dart';
import 'package:moviesearch/features/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:moviesearch/features/movies/domain/usecases/is_favourite_usecase.dart';
import 'package:moviesearch/features/movies/domain/usecases/search_movies_usecase.dart';
import 'package:moviesearch/features/movies/domain/usecases/toggle_favourite_usecase.dart';
import 'package:moviesearch/features/movies/presentation/detail_bloc/detail_bloc.dart';
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';
import 'package:moviesearch/features/movies/presentation/search_bloc/search_bloc.dart';

import '../../features/movies/data/repositories/movie_repository_impl.dart';
import '../../features/movies/domain/repositories/movie_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remote: sl(), local: sl()),
  );

  sl.registerLazySingleton(() => SearchMoviesUsecase(sl()));
  sl.registerLazySingleton(() => GetMovieDetail(sl()));
  sl.registerLazySingleton(() => ToggleFavourite(sl()));
  sl.registerLazySingleton(() => GetFavourites(sl()));
  sl.registerLazySingleton(() => IsFavourite(sl()));

  sl.registerFactory(() => DetailBloc(getMovieDetail: sl()));
  sl.registerFactory(() => SearchBloc(searchMovies: sl()));
  sl.registerFactory(
    () => FavouriteBloc(toggleFavourite: sl(), getFavourites: sl()),
  );
}
