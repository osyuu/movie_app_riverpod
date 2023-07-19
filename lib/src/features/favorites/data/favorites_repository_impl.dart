
import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/src/features/favorites/data/favorites_api.dart';
import 'package:movie_app_riverpod/src/features/favorites/domain/entities/favorite_movie_entity.dart';
import 'package:movie_app_riverpod/src/features/favorites/domain/favorites_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/tmdb_movie_entity.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  FavoritesRepositoryImpl({
    required this.favoritesApi,
  });

  final FavoritesApi favoritesApi;

  @override
  Future<List<FavoriteMovieEntity>> getFavoriteMovies({
    CancelToken? cancelToken,
  }) async {
    final response = await favoritesApi.getFavoriteMovies(cancelToken: cancelToken);
    final favorites = response.map((favorite) => FavoriteMovieEntity.fromModel(favorite)).toList();
    return favorites;
  }

  @override
  Future<FavoriteMovieEntity> addFavorite({
    required TMDBMovieEntity movie,
    CancelToken? cancelToken,
  }) async {
    final response = await favoritesApi.addFavorite(movie: movie, cancelToken: cancelToken);
    return FavoriteMovieEntity(
      uuid: response,
      movie: movie,
    );
  }

  @override
  Future<String> removeFavorite({
    required String uuid,
    CancelToken? cancelToken,
  }) async {
    await favoritesApi.removeFavorite(uuid: uuid, cancelToken: cancelToken);
    return uuid;
  }
}
