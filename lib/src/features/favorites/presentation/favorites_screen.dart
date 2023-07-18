import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_riverpod/src/features/favorites/presentation/favorite_movie_list_tile.dart';
import 'package:movie_app_riverpod/src/features/favorites/presentation/favorite_movies_controller.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movie_list_tile_shimmer.dart';
import 'package:movie_app_riverpod/src/route/app_router.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesList = ref.watch(favoriteMoviesControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: RefreshIndicator(
          onRefresh: () {
            ref.invalidate(favoriteMoviesControllerProvider);
            return ref.read(
                favoriteMoviesControllerProvider.future
            );
          },
          child: ListView.custom(
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return favoritesList.when(
                  error: (err, stack) => Text('Error $err'),
                  loading: () => const MovieListTileShimmer(),
                  data: (favorites) {
                    final favorite = favorites[index];
                    return FavoriteMovieListTile(
                      favorite: favorite,
                      debugUuid: favorite.uuid,
                      onPressed: () => context.goNamed(
                        AppRoute.favorite.name,
                        extra: favorite.movie,
                        pathParameters: {'id': favorite.movie.id.toString()},
                      ),
                      onDismissed: () {
                        ref.read(favoriteMoviesControllerProvider.notifier).removeFavorite(favorite.uuid);
                      },
                      action1: (BuildContext context) {
                        ref.read(favoriteMoviesControllerProvider.notifier).removeFavorite(favorite.uuid);
                      },
                    );
                  }
              );
            },
            childCount: favoritesList.value?.length
            ),
          )
      ),
    );
  }
}