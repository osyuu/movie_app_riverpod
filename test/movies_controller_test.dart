import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movies_controller.dart';


// create a mock for the class we need to test
class MockMoviesRepository extends Mock implements MoviesRepository {
  @override
  Future<List<TMDBMovieEntity>> searchMovies({
    required int page,
    String query = '2',
    CancelToken? cancelToken,
  }) async {
    return [
      TMDBMovieEntity(id: 2, title: 'title2'),
    ];
  }

  @override
  Future<List<TMDBMovieEntity>> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    return [
      TMDBMovieEntity(id: 1, title: 'title1'),
      TMDBMovieEntity(id: 2, title: 'title2'),
      TMDBMovieEntity(id: 3, title: 'title3'),
    ];
  }
}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  ProviderContainer makeProviderContainer(MockMoviesRepository moviesRepository) {
    final container = ProviderContainer(
      overrides: [
        moviesRepositoryProvider.overrideWithValue(moviesRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('searchMovies', () {
    test('success', () async {
      final pagination = MoviesPagination(page: 1, query: '2');
      final provider = moviesControllerProvider.call(pagination: pagination);
      final moviesRepository = MockMoviesRepository();
      final container = makeProviderContainer(moviesRepository);
      final listener = Listener<AsyncValue<List<TMDBMovieEntity>>>();
      container.listen(
        provider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(provider),
        const AsyncValue<List<TMDBMovieEntity>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(provider.future);

      // Exposes the data fetched
      expect(container.read(provider).value, [
        TMDBMovieEntity(id: 2, title: 'title2'),
      ]);
    });
  });

  group('nowPlayingMovies', () {
    test('success', () async {
      final pagination = MoviesPagination(page: 1, query: '');
      final provider = moviesControllerProvider.call(pagination: pagination);
      final moviesRepository = MockMoviesRepository();
      final container = makeProviderContainer(moviesRepository);
      final listener = Listener<AsyncValue<List<TMDBMovieEntity>>>();
      container.listen(
        provider,
        listener,
        fireImmediately: true,
      );

      // The first read if the loading state
      expect(
        container.read(provider),
        const AsyncValue<List<TMDBMovieEntity>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(provider.future);

      // Exposes the data fetched
      expect(container.read(provider).value, [
        TMDBMovieEntity(id: 1, title: 'title1'),
        TMDBMovieEntity(id: 2, title: 'title2'),
        TMDBMovieEntity(id: 3, title: 'title3'),
      ]);
    });
  });

}