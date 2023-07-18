import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/favorites_repository.dart';
import 'package:movie_app_riverpod/src/features/favorites/model/favorite_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'favorite_movies_controller.g.dart';

@riverpod
class FavoriteMoviesController extends _$FavoriteMoviesController {
  Future<List<FavoriteMovie>> _fetchMovies() async {
    final favoritesRepo = ref.watch(favoritesRepositoryProvider);
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
    final result = await favoritesRepo.getFavoriteMovies();
    return result;
  }

  @override
  FutureOr<List<FavoriteMovie>> build() async {
    return _fetchMovies();
  }

  Future<void> addFavorite(TMDBMovie movie) async {
    final favoritesRepo = ref.watch(favoritesRepositoryProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await favoritesRepo.addFavorite(movie: FavoriteMovie(uuid: const Uuid().v4(), movie: movie));
      return _fetchMovies();
    });
  }

  Future<void> removeFavorite(String uuid) async {
    final favoritesRepo = ref.watch(favoritesRepositoryProvider);
    final result = [...?state.value];
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await favoritesRepo.removeFavorite(uuid: uuid);
      final index = result.indexWhere((favorite) => favorite.uuid == uuid);
      result.removeAt(index);
      return result;
    });
  }
}
