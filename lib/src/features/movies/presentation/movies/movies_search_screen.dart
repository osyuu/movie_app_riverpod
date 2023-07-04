
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movie_list_tile_shimmer.dart';
import 'package:movie_app_riverpod/src/route/app_router.dart';

import 'movie_list_tile.dart';
import 'movies_provider.dart';
import 'movies_search_bar.dart';

class MoviesSearchScreen extends ConsumerWidget {
  const MoviesSearchScreen({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(moviesSearchTextProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Movies'),
      ),
      body: Column(
        children: [
          const MoviesSearchBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                // ref.invalidate(fetchMoviesProvider);
                // return ref.read(
                //   fetchMoviesProvider(
                //     pagination: MoviesPagination(page: 1, query: query)
                //   ).future
                // );
                ref.invalidate(moviesControllerProvider);
                return ref.read(
                  moviesControllerProvider(
                    pagination: MoviesPagination(page: 1, query: query)
                  ).future
                );
              },
              child: ListView.custom(
                childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;
                  // final moviesList = ref.watch(
                  //   fetchMoviesProvider(
                  //     pagination: MoviesPagination(page: page, query: query)
                  //   )
                  // );
                  final moviesList = ref.watch(
                    moviesControllerProvider(
                      pagination: MoviesPagination(page: page, query: query)
                    )
                  );

                  return moviesList.when(
                    error: (err, stack) => Text('Error $err'),
                    loading: () => const MovieListTileShimmer(),
                    data: (movies) {
                      if (indexInPage >= movies.length) {
                        return const MovieListTileShimmer();
                      }
                      final movie = movies[indexInPage];
                      return MovieListTile(
                        movie: movie,
                        debugIndex: index,
                        onPressed: () => context.goNamed(
                          AppRoute.movie.name,
                          extra: movie,
                          pathParameters: {'id': movie.id.toString()},
                        ),
                      );
                    }
                  );
                }),
              )
            ),
          ),
        ],
      ),
    );
  }
}

