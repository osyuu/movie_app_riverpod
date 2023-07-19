import 'dart:async';

import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/movies_repository.dart';
import 'package:movie_app_riverpod/src/utils/cancel_token_ref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  Future<TMDBMovieEntity> movie({
    required int movieId,
  }) async {
    final moviesRepo = ref.watch(moviesRepositoryProvider);
    final cancelToken = ref.cancelToken();
    return await moviesRepo.movie(movieId: movieId, cancelToken: cancelToken);
  }

  @override
  FutureOr<TMDBMovieEntity> build(int movieId) async {
    return await movie(movieId: movieId);
  }
}