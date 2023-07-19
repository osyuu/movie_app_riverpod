
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/models/favorite_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';

part 'favorite_movie_entity.freezed.dart';

@freezed
class FavoriteMovieEntity with _$FavoriteMovieEntity {
  factory FavoriteMovieEntity({
    required String uuid,
    required TMDBMovieEntity movie,
  }) = _FavoriteMovieEntity;

  factory FavoriteMovieEntity.fromModel(FavoriteMovie model) {
    return FavoriteMovieEntity(
      uuid: model.uuid,
      movie: TMDBMovieEntity.fromModel(model.movie),
    );
  }
}