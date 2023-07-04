import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_provider.g.dart';

// final moviesSearchTextProvider = StateProvider.autoDispose((ref) => TextEditingController(text: ''));
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
  @override
  FutureOr<List<TMDBMovie>> build({
    required MoviesPagination pagination,
  }) async {
    final result = await fetchMovies(pagination: pagination);
    return result.value!;
  }

  Future<AsyncValue<List<TMDBMovie>>> fetchMovies({
    required MoviesPagination pagination,
  }) async {
    final moviesRepo = ref.read(moviesRepositoryProvider);
    state = const AsyncLoading();
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
    if (pagination.query.isEmpty) {
      // use non-search endpoint
      state = await AsyncValue.guard(() => moviesRepo.nowPlayingMovies(
        page: pagination.page,
        cancelToken: cancelToken,
      ));
    } else {
      // Debounce the request. By having this delay, consumers can subscribe to
      // different parameters. In which case, this request will be aborted.
      await Future.delayed(const Duration(milliseconds: 500));
      if (cancelToken.isCancelled) throw AbortedException();

      state = await AsyncValue.guard(() => moviesRepo.searchMovies(
        page: pagination.page,
        query: pagination.query,
        cancelToken: cancelToken,
      ));
    }
    return state;
  }
}