import 'package:freezed_annotation/freezed_annotation.dart';

import 'favorite_movie.dart';

part 'favorite_movies_response.freezed.dart';
part 'favorite_movies_response.g.dart';

@freezed
class FavoriteMoviesResponse with _$FavoriteMoviesResponse{
  factory FavoriteMoviesResponse({
    required List<FavoriteMovie> results,
    @Default([]) List<String> errors,
  }) = _FavoriteMoviesResponse;

  factory FavoriteMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMoviesResponseFromJson(json);
}

extension FavoriteMoviesResponseX on FavoriteMoviesResponse {
  //@late
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return results.isNotEmpty;
  }

  bool hasErrors() {
    return errors.isNotEmpty;
  }
}