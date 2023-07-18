import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app_riverpod/src/common_widgets/movie_poster.dart';
import 'package:movie_app_riverpod/src/common_widgets/top_gradient.dart';
import 'package:movie_app_riverpod/src/features/favorites/model/favorite_movie.dart';

class FavoriteMovieListTile extends StatelessWidget {
  const FavoriteMovieListTile({
    super.key,
    required this.favorite,
    this.debugUuid,
    this.onPressed,
    required this.onDismissed,
    this.action1,
  });
  final String? debugUuid;
  final FavoriteMovie favorite;
  final VoidCallback? onPressed;
  final VoidCallback onDismissed;
  final ValueSetter<BuildContext>? action1;

  @override
  Widget build(BuildContext context) {
    final movie = favorite.movie;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Slidable(
        key: Key('favorite_movie_list_tile_${favorite.uuid}'),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: onDismissed,
          ),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: action1,
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.yellow,
              icon: Icons.delete,
              label: 'Delete',
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
                  if (debugUuid != null) ...[
                    const Positioned.fill(child: TopGradient()),
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Text(
                        '$debugUuid',
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