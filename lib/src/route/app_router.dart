
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_riverpod/src/features/favorites/presentation/favorites_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/model/tmdb_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movie_details/movie_details_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/presentation/movies/movies_search_screen.dart';
import 'package:movie_app_riverpod/src/route/scaffold_with_bottom_nav_bar.dart';

enum AppRoute {
  movies,
  movie,
  favorites,
  favorite,
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/movies',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          // Products
          GoRoute(
            path: '/movies',
            name: AppRoute.movies.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const MoviesSearchScreen()
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.movie.name,
                pageBuilder: (context, state) {
                  final id = int.parse(state.pathParameters['id'] as String);
                  final movie = state.extra as TMDBMovie?;
                  return MaterialPage(
                    key: state.pageKey,
                    child: MovieDetailsScreen(movieId: id, movie: movie),
                  );
                },
              ),
            ]
          ),
          // Shopping Cart
          GoRoute(
            path: '/favorites',
            name: AppRoute.favorites.name,
            pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const FavoritesScreen()
            ),
              routes: [
                GoRoute(
                  path: ':id',
                  name: AppRoute.favorite.name,
                  pageBuilder: (context, state) {
                    final id = int.parse(state.pathParameters['id'] as String);
                    final movie = state.extra as TMDBMovie?;
                    return MaterialPage(
                      key: state.pageKey,
                      child: MovieDetailsScreen(movieId: id, movie: movie),
                    );
                  },
                ),
              ]
          ),
        ]
      )
    ],
  );
});