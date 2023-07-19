import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/movies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_controller.g.dart';

@riverpod
class MoviesSearchText extends _$MoviesSearchText {
  @override
  String build() {
    return '';
  }

  void change(String value) {
    state = value;
  }
}

@riverpod
class MoviesController extends _$MoviesController {
  Future<List<TMDBMovieEntity>> fetchMovies({
    required MoviesPagination pagination,
  }) async {
    final moviesRepo = ref.watch(moviesRepositoryProvider);
    final cancelToken = CancelToken();
    // When a page is no-longer used, keep it in the cache.
    final link = ref.keepAlive();
    Timer? timer;
    // When the provider is destroyed, cancel the http request and the timer
    ref.onDispose(() {
      cancelToken.cancel();
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    ref.onCancel(() {
      // start a 30 second timer
      timer = Timer(const Duration(seconds: 30), () {
        // dispose on timeout
        link.close();
      });
    });
    // If the provider is listened again after it was paused, cancel the timer
    ref.onResume(() {
      timer?.cancel();
    });
    List<TMDBMovieEntity> result;
    if (pagination.query.isEmpty) {
      // use non-search endpoint
      result = await moviesRepo.nowPlayingMovies(
        page: pagination.page,
        cancelToken: cancelToken,
      );
    } else {
      // Debounce the request. By having this delay, consumers can subscribe to
      // different parameters. In which case, this request will be aborted.
      await Future.delayed(const Duration(milliseconds: 500));
      if (cancelToken.isCancelled) throw AbortedException();

      result = await moviesRepo.searchMovies(
        page: pagination.page,
        query: pagination.query,
        cancelToken: cancelToken,
      );
    }
    return result;
  }

  @override
  FutureOr<List<TMDBMovieEntity>> build({
    required MoviesPagination pagination,
  }) async {
    return await fetchMovies(pagination: pagination);
  }

}