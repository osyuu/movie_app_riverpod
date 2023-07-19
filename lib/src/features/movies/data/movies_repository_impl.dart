
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_api.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesRepositoryImpl({
    required this.moviesApi,
  });

  final MoviesApi moviesApi;

  @override
  Future<List<TMDBMovieEntity>> searchMovies({
    required int page,
    String query = '',
    CancelToken? cancelToken,
  }) async {
    final result = await moviesApi.searchMovies(page: page, query: query, cancelToken: cancelToken);
    return result.map((model) => TMDBMovieEntity.fromModel(model)).toList();
  }

  @override
  Future<List<TMDBMovieEntity>> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final result = await moviesApi.nowPlayingMovies(page: page, cancelToken: cancelToken);
    return result.map((model) => TMDBMovieEntity.fromModel(model)).toList();
  }

  @override
  Future<TMDBMovieEntity> movie({
    required int movieId,
    CancelToken? cancelToken
  }) async {
    final result = await moviesApi.movie(movieId: movieId, cancelToken: cancelToken);
    return TMDBMovieEntity.fromModel(result);
  }
}