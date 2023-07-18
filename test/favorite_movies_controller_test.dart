import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/favorites_repository.dart';
import 'package:movie_app_riverpod/src/features/favorites/model/favorite_movie.dart';
import 'package:movie_app_riverpod/src/features/favorites/presentation/favorite_movies_controller.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';


// create a mock for the class we need to test
class MockFavoritesRepository extends Mock implements FavoritesRepository {
  @override
  Future<List<FavoriteMovie>> getFavoriteMovies({
    CancelToken? cancelToken,
  }) async {
    return [
      FavoriteMovie(uuid: '123', movie: TMDBMovie(id: 1, title: "title")),
      FavoriteMovie(uuid: 'abc', movie: TMDBMovie(id: 2, title: "title2")),
      FavoriteMovie(uuid: 'zz1', movie: TMDBMovie(id: 3, title: "title3")),
    ];
  }

  @override
  Future<FavoriteMovie> addFavorite({
    required FavoriteMovie movie,
    CancelToken? cancelToken,
  }) async {
    return FavoriteMovie(uuid: 'vsf32r', movie: TMDBMovie(id: 4, title: "title4"));
  }

  @override
  Future<FavoriteMovie> removeFavorite({
    required String uuid,
    CancelToken? cancelToken,
  }) async {
    return FavoriteMovie(uuid: 'abc', movie: TMDBMovie(id: 2, title: "title2"));
  }
}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  ProviderContainer makeProviderContainer(MockFavoritesRepository favoritesRepository) {
    final container = ProviderContainer(
      overrides: [
        favoritesRepositoryProvider.overrideWithValue(favoritesRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('initialization', () {
    test('initial state is AsyncData', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovie>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovie>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.future);

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovie(uuid: '123', movie: TMDBMovie(id: 1, title: "title")),
        FavoriteMovie(uuid: 'abc', movie: TMDBMovie(id: 2, title: "title2")),
        FavoriteMovie(uuid: 'zz1', movie: TMDBMovie(id: 3, title: "title3")),
      ]);
    });
  });

  group('add', () {
    test('success', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovie>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovie>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.future);

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.notifier).addFavorite(
          TMDBMovie(id: 4, title: "title4")
      );

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovie(uuid: '123', movie: TMDBMovie(id: 1, title: "title")),
        FavoriteMovie(uuid: 'abc', movie: TMDBMovie(id: 2, title: "title2")),
        FavoriteMovie(uuid: 'zz1', movie: TMDBMovie(id: 3, title: "title3")),
        FavoriteMovie(uuid: 'vsf32r', movie: TMDBMovie(id: 4, title: "title4")),
      ]);
    });
  });

  group('remove', () {
    test('success', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovie>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovie>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.future);

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.notifier).removeFavorite('abc');

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovie(uuid: '123', movie: TMDBMovie(id: 1, title: "title")),
        FavoriteMovie(uuid: 'zz1', movie: TMDBMovie(id: 3, title: "title3")),
      ]);
    });
  });
}