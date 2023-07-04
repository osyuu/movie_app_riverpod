import 'dart:async';

import 'package:movie_app_riverpod/src/features/movies/data/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/utils/cancel_token_ref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  @override
  Future<TMDBMovie> build(int movieId) async {
    final moviesRepo = ref.read(moviesRepositoryProvider);
    state = const AsyncLoading();
    final cancelToken = ref.cancelToken();
    state = await AsyncValue.guard(() => moviesRepo.movie(movieId: movieId, cancelToken: cancelToken));
    return state.value!;
  }

  Future<void> movie({
    required int movieId,
  }) async {
    final moviesRepo = ref.read(moviesRepositoryProvider);
    state = const AsyncLoading();
    final cancelToken = ref.cancelToken();
    state = await AsyncValue.guard(() => moviesRepo.movie(movieId: movieId, cancelToken: cancelToken));
  }
}