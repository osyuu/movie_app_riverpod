
import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/env/env.dart';
import 'package:movie_app_riverpod/src/features/movies/data/models/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/data/models/tmdb_movies_response.dart';
import 'package:movie_app_riverpod/src/utils/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_api.g.dart';

class MoviesApi {
  MoviesApi({
    required this.client,
    required this.apiKey
  });

  final Dio client;
  final String apiKey;

  Future<List<TMDBMovie>> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'page': '$page',
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final movies = TMDBMoviesResponse.fromJson(response.data);
    return movies.results;
  }

  Future<List<TMDBMovie>> searchMovies({
    required int page,
    String query = '',
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/search/movie',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'page': '$page',
        'query': query,
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final movies = TMDBMoviesResponse.fromJson(response.data);
    return movies.results;
  }

  Future<TMDBMovie> movie({
    required int movieId,
    CancelToken? cancelToken
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/$movieId',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    return TMDBMovie.fromJson(response.data);
  }
}

@riverpod
MoviesApi moviesApi(MoviesApiRef ref) => MoviesApi(
  client: ref.watch(dioProvider),
  apiKey: Env.tmdbApiKey,
);