import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_api.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_repository_impl.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository.g.dart';

abstract class MoviesRepository {
  Future<List<TMDBMovieEntity>> searchMovies({
    required int page,
    String query = '',
    CancelToken? cancelToken,
  });

  Future<List<TMDBMovieEntity>> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  });

  Future<TMDBMovieEntity> movie({
    required int movieId,
    CancelToken? cancelToken
  });
}

class AbortedException implements Exception {
}

@riverpod
MoviesRepository moviesRepository(MoviesRepositoryRef ref) => MoviesRepositoryImpl(
  moviesApi: ref.watch(moviesApiProvider),
);
