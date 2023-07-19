
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movie_details/movie_controller.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movie_list_tile.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movie_list_tile_shimmer.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.movie
  });
  final int movieId;
  final TMDBMovieEntity? movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (movie != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(movie!.title),
        ),
        body: Column(
          children: [
            MovieListTile(movie: movie!),
          ],
        ),
      );
    } else {
      final movieAsync = ref.watch(movieControllerProvider(movieId));

      return movieAsync.when(
        error: (err, stack) => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Error'),
          ),
          body: Center(child: Text(err.toString())),
        ),
        loading: () => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Loading'),
          ),
          body: const Column(
            children: [
              MovieListTileShimmer(),
            ],
          ),
        ),
        data: (movie) => Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Column(
            children: [
              MovieListTile(movie: movie),
            ],
          ),
        ),
      );
    }
  }
}
