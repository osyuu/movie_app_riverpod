
import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/favorites_api.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/favorites_repository_impl.dart';
import 'package:movie_app_riverpod/src/features/favorites/domain/entities/favorite_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

abstract class FavoritesRepository {
  Future<List<FavoriteMovieEntity>> getFavoriteMovies({
    CancelToken? cancelToken,
  });

  Future<FavoriteMovieEntity> addFavorite({
    required TMDBMovieEntity movie,
    CancelToken? cancelToken,
  });

  Future<String> removeFavorite({
    required String uuid,
    CancelToken? cancelToken,
  });
}

@riverpod
FavoritesRepository favoritesRepository(FavoritesRepositoryRef ref) => FavoritesRepositoryImpl(
  favoritesApi: ref.watch(favoritesApiProvider)
);