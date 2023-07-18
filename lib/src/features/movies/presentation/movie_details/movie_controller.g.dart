// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieControllerHash() => r'5030391db75af32d060a27a96eacc0d4640a200b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MovieController
    extends BuildlessAutoDisposeAsyncNotifier<TMDBMovie> {
  late final int movieId;

  FutureOr<TMDBMovie> build(
    int movieId,
  );
}

/// See also [MovieController].
@ProviderFor(MovieController)
const movieControllerProvider = MovieControllerFamily();

/// See also [MovieController].
class MovieControllerFamily extends Family<AsyncValue<TMDBMovie>> {
  /// See also [MovieController].
  const MovieControllerFamily();

  /// See also [MovieController].
  MovieControllerProvider call(
    int movieId,
  ) {
    return MovieControllerProvider(
      movieId,
    );
  }

  @override
  MovieControllerProvider getProviderOverride(
    covariant MovieControllerProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieControllerProvider';
}

/// See also [MovieController].
class MovieControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MovieController, TMDBMovie> {
  /// See also [MovieController].
  MovieControllerProvider(
    this.movieId,
  ) : super.internal(
          () => MovieController()..movieId = movieId,
          from: movieControllerProvider,
          name: r'movieControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieControllerHash,
          dependencies: MovieControllerFamily._dependencies,
          allTransitiveDependencies:
              MovieControllerFamily._allTransitiveDependencies,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is MovieControllerProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<TMDBMovie> runNotifierBuild(
    covariant MovieController notifier,
  ) {
    return notifier.build(
      movieId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
