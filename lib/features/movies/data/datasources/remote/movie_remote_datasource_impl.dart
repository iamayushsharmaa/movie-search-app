import 'package:dio/dio.dart';
import 'package:moviesearch/core/config/env_config.dart';

import '../../models/movie_model.dart';
import 'movie_remote_datasource.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieModel> getMovieDetail(String imdbId) async {
    final response = await dio.get(
      EnvConfig.baseUrl,
      queryParameters: {'i': imdbId, 'apikey': EnvConfig.apiKey},
    );

    if (response.data['Response'] == 'False') {
      throw Exception(response.data['Error']);
    }

    return MovieModel.fromDetailJson(response.data);
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await dio.get(
      EnvConfig.baseUrl,
      queryParameters: {'s': query, 'apikey': EnvConfig.apiKey},
    );

    if (response.data['Response'] == 'False') {
      throw Exception(response.data['Error']);
    }

    final List movies = response.data['Search'];

    return movies.map((json) => MovieModel.fromSearchJson(json)).toList();
  }
}
