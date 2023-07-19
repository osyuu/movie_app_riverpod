
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/models/favorite_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/data/models/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:movie_app_riverpod/src/utils/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_api.g.dart';

class FavoritesApi {
  FavoritesApi({
    required this.client,
  });

  final Dio client;

  Future<List<FavoriteMovie>> getFavoriteMovies({
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'riverpodmovie-75f0b-default-rtdb.firebaseio.com',
      path: 'favorites.json',
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    if (response.data == null) { return []; }
    final firebaseData = response.data as Map<String, dynamic>;
    List<FavoriteMovie> results = [];
    await Future.forEach(firebaseData.entries, (entry) {
      results.add(FavoriteMovie.fromJson({
        'uuid': entry.key,
        'movie': entry.value['movie']
      }));
    });
    // final movies = FavoriteMoviesResponse.fromJson({"results": results});
    return results;
  }

  Future<String> addFavorite({
    required TMDBMovieEntity movie,
    CancelToken? cancelToken,
  }) async {
    final data = TMDBMovie(
      id: movie.id,
      voteCount: movie.voteCount,
      video: movie.video,
      voteAverage: movie.voteAverage,
      title: movie.title,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      genreIds: movie.genreIds,
      backdropPath: movie.backdropPath,
      adult: movie.adult,
      overview: movie.overview,
      releaseDate: movie.releaseDate,
    );
    final url = Uri(
      scheme: 'https',
      host: 'riverpodmovie-75f0b-default-rtdb.firebaseio.com',
      path: 'favorites.json',
    ).toString();
    final response = await client.post(
        url,
        data: jsonEncode({
          'movie': data.toJson(),
          // 'uuid': movie.uuid,
        }),
        cancelToken: cancelToken
    );
    final firebaseData = response.data as Map<String, dynamic>;
    return firebaseData['name'] as String;
  }

  Future<void> removeFavorite({
    required String uuid,
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'riverpodmovie-75f0b-default-rtdb.firebaseio.com',
      path: 'favorites/$uuid.json',
    ).toString();
    await client.delete(
        url,
        // data: {
        //   'uuid': uuid
        // },
        cancelToken: cancelToken
    );
  }
}

@riverpod
FavoritesApi favoritesApi(FavoritesApiRef ref) => FavoritesApi(
  client: ref.watch(dioProvider),
);