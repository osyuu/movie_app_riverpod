import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_riverpod/src/features/favorites/domain/entities/favorite_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/favorites/domain/favorites_repository.dart';
import 'package:movie_app_riverpod/src/features/favorites/presentation/favorite_movies_controller.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';


// create a mock for the class we need to test
class MockFavoritesRepository extends Mock implements FavoritesRepository {
  @override
  Future<List<FavoriteMovieEntity>> getFavoriteMovies({
    CancelToken? cancelToken,
  }) async {
    return [
      FavoriteMovieEntity(uuid: '123', movie: TMDBMovieEntity(id: 1, title: "title1")),
      FavoriteMovieEntity(uuid: 'abc', movie: TMDBMovieEntity(id: 2, title: "title2")),
      FavoriteMovieEntity(uuid: 'zz1', movie: TMDBMovieEntity(id: 3, title: "title3")),
    ];
  }

  @override
  Future<FavoriteMovieEntity> addFavorite({
    required TMDBMovieEntity movie,
    CancelToken? cancelToken,
  }) async {
    return FavoriteMovieEntity(uuid: '4vvv', movie: TMDBMovieEntity(id: 4, title: "title4"));
  }

  @override
  Future<String> removeFavorite({
    required String uuid,
    CancelToken? cancelToken,
  }) async {
    return uuid;
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

  group('getFavoriteMovies', () {
    test('success', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovieEntity>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovieEntity>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.future);

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovieEntity(uuid: '123', movie: TMDBMovieEntity(id: 1, title: "title1")),
        FavoriteMovieEntity(uuid: 'abc', movie: TMDBMovieEntity(id: 2, title: "title2")),
        FavoriteMovieEntity(uuid: 'zz1', movie: TMDBMovieEntity(id: 3, title: "title3")),
      ]);
    });
  });

  group('addFavoriteMovies', () {
    test('success', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovieEntity>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovieEntity>>.loading(),
      );

      /// Wait for init finish
      await container.read(favoriteMoviesControllerProvider.future);

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.notifier).addFavorite(
          TMDBMovieEntity(id: 4, title: "title4")
      );

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovieEntity(uuid: '123', movie: TMDBMovieEntity(id: 1, title: "title1")),
        FavoriteMovieEntity(uuid: 'abc', movie: TMDBMovieEntity(id: 2, title: "title2")),
        FavoriteMovieEntity(uuid: 'zz1', movie: TMDBMovieEntity(id: 3, title: "title3")),
        FavoriteMovieEntity(uuid: '4vvv', movie: TMDBMovieEntity(id: 4, title: "title4")),
      ]);
    });
  });

  group('removeFavoriteMovies', () {
    test('success', () async {
      final favoritesRepository = MockFavoritesRepository();
      final container = makeProviderContainer(favoritesRepository);
      final listener = Listener<AsyncValue<List<FavoriteMovieEntity>>>();
      container.listen(
        favoriteMoviesControllerProvider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(favoriteMoviesControllerProvider),
        const AsyncValue<List<FavoriteMovieEntity>>.loading(),
      );

      /// Wait for init finish
      await container.read(favoriteMoviesControllerProvider.future);

      /// Wait for the request to finish
      await container.read(favoriteMoviesControllerProvider.notifier).removeFavorite('abc');

      // Exposes the data fetched
      expect(container.read(favoriteMoviesControllerProvider).value, [
        FavoriteMovieEntity(uuid: '123', movie: TMDBMovieEntity(id: 1, title: "title1")),
        FavoriteMovieEntity(uuid: 'zz1', movie: TMDBMovieEntity(id: 3, title: "title3")),
      ]);
    });
  });
}