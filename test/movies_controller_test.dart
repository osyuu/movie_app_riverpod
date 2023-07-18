import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movies_controller.dart';


// create a mock for the class we need to test
class MockMoviesRepository extends Mock implements MoviesRepository {
  @override
  Future<List<TMDBMovie>> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    return [
      TMDBMovie(id: 1, title: "title"),
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
        // moviesControllerProvider(pagination: MoviesPagination(page: 1, query: ''))
        // moviesControllerProvider.call(pagination: MoviesPagination(page: 1, query: '')),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('initialization', () {
    test('initial state is AsyncData', () async {
      final moviesRepository = MockMoviesRepository();
      final container = makeProviderContainer(moviesRepository);
      final listener = Listener<AsyncValue<List<TMDBMovie>>>();
      container.listen(
        moviesControllerProvider.call(pagination: MoviesPagination(page: 1, query: '')),
        listener,
        fireImmediately: true,
      );
      // verify initial value from build method
      verify(() => listener(null, const AsyncLoading()));
      // verify that the listener is no longer called
      verifyNoMoreInteractions(listener);
      // verify(() => moviesRepository.nowPlayingMovies(page: 1)).called(1);
    });
  });

  group('nowPlayingMovies', () {
    test('success', () async {
      // setup
      final moviesRepository = MockMoviesRepository();
      final container = makeProviderContainer(moviesRepository);
      final provider = moviesControllerProvider.call(pagination: MoviesPagination(page: 1, query: ''));
      // The first read if the loading state
      expect(
        container.read(provider),
        const AsyncValue<List<TMDBMovie>>.loading(),
      );

      /// Wait for the request to finish
      await container.read(provider.future);

      // Exposes the data fetched
      expect(container.read(provider).value, [
        isA<TMDBMovie>()
            .having((s) => s.id, 'id', 1)
            .having((s) => s.title, 'title', 'title')
      ]);

    });

    // test('failure', () async {
    //   // setup
    //   final moviesRepository = MockMoviesRepository();
    //   final container = makeProviderContainer(moviesRepository);
    //   final provider = moviesControllerProvider.call(pagination: MoviesPagination(page: 1, query: ''));
    //   final exception = Exception('Connection failed');
    //   // when(() => moviesRepository.nowPlayingMovies(page: 1))
    //   //     .thenThrow(exception);
    //   final listener = Listener<AsyncValue<void>>();
    //   container.listen(
    //     provider,
    //     listener,
    //     fireImmediately: true,
    //   );
    //   // verify initial value from build method
    //   verify(() => listener(null, const AsyncValue<List<TMDBMovie>>.loading()));
    //   // run
    //   await container.read(provider.future);
    //   // verify
    //   // verifyInOrder([
    //   //   // set loading state
    //   //   // * use a matcher since AsyncLoading != AsyncLoading with data
    //   //       () => listener(AsyncData<void>(null), any(that: isA<AsyncLoading>())),
    //   //   // error when complete
    //   //       () => listener(
    //   //       any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
    //   // ]);
    //   verifyNoMoreInteractions(listener);
    //   verify(() => moviesRepository.nowPlayingMovies(page: 1)).called(1);
    // });
  });
}