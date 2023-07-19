import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_riverpod/src/features/movies/data/models/tmdb_movie.dart';

part 'tmdb_movie_entity.freezed.dart';

@freezed
class TMDBMovieEntity with _$TMDBMovieEntity {
  factory TMDBMovieEntity({
    int? voteCount,
    required int id,
    @Default(false) bool video,
    double? voteAverage,
    required String title,
    double? popularity,
    String? posterPath,
    String? originalLanguage,
    String? originalTitle,
    List<int>? genreIds,
    String? backdropPath,
    bool? adult,
    String? overview,
    String? releaseDate,
  }) = _TMDBMovie;

  factory TMDBMovieEntity.fromModel(TMDBMovie model) {
    return TMDBMovieEntity(
      id: model.id,
      voteCount: model.voteCount,
      video: model.video,
      voteAverage: model.voteAverage,
      title: model.title,
      popularity: model.popularity,
      posterPath: model.posterPath,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      genreIds: model.genreIds,
      backdropPath: model.backdropPath,
      adult: model.adult,
      overview: model.overview,
      releaseDate: model.releaseDate,
    );
  }
}