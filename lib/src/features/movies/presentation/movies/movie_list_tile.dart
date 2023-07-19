
import 'package:flutter/material.dart';
import 'package:movie_app_riverpod/src/common_widgets/movie_poster.dart';
import 'package:movie_app_riverpod/src/common_widgets/top_gradient.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
    // debugging hint to show the tile index
    this.debugIndex,
    this.onPressed,
    this.action1,
  });
  final TMDBMovieEntity movie;
  final int? debugIndex;
  final VoidCallback? onPressed;
  final ValueSetter<BuildContext>? action1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: action1,
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.yellow,
              icon: Icons.star,
              label: 'Favorite',
            ),
          ],
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Stack(
                children: [
                  SizedBox(
                    width: MoviePoster.width,
                    height: MoviePoster.height,
                    child: MoviePoster(imagePath: movie.posterPath),
                  ),
                  if (debugIndex != null) ...[
                    const Positioned.fill(child: TopGradient()),
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Text(
                        '$debugIndex',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (movie.releaseDate != null) ...[
                    const SizedBox(height: 8),
                    Text('Released: ${movie.releaseDate}'),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}