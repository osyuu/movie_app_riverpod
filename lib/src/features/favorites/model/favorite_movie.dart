import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';

part 'favorite_movie.freezed.dart';
part 'favorite_movie.g.dart';

@freezed
class FavoriteMovie with _$FavoriteMovie {
  factory FavoriteMovie({
    required String uuid,
    required TMDBMovie movie,
  }) = _FavoriteMovie;

  factory FavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieFromJson(json);
}