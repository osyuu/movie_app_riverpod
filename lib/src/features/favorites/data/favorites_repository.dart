
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/favorites/model/favorite_movie.dart';
import 'package:movie_app_riverpod/src/utils/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

class FavoritesRepository {
  FavoritesRepository({
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

  Future<void> addFavorite({
    required FavoriteMovie movie,
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'riverpodmovie-75f0b-default-rtdb.firebaseio.com',
      path: 'favorites.json',
    ).toString();
    await client.post(
        url,
        data: jsonEncode({
          'movie': movie.movie.toJson(),
          // 'uuid': movie.uuid,
        }),
        cancelToken: cancelToken
    );
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
FavoritesRepository favoritesRepository(FavoritesRepositoryRef ref) => FavoritesRepository(
  client: ref.watch(dioProvider),
);