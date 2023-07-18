import 'dart:async';

import 'package:movie_app_riverpod/src/features/movies/data/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/utils/cancel_token_ref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  Future<TMDBMovie> movie({
    required int movieId,
  }) async {
    final moviesRepo = ref.watch(moviesRepositoryProvider);
    final cancelToken = ref.cancelToken();
    return await moviesRepo.movie(movieId: movieId, cancelToken: cancelToken);
  }

  @override
  FutureOr<TMDBMovie> build(int movieId) async {
    return await movie(movieId: movieId);
  }
}