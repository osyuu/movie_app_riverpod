// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesSearchTextHash() => r'57c7ed9d3c97eb444c096d829fcee66a68c2a546';

/// See also [MoviesSearchText].
@ProviderFor(MoviesSearchText)
final moviesSearchTextProvider =
    AutoDisposeNotifierProvider<MoviesSearchText, String>.internal(
  MoviesSearchText.new,
  name: r'moviesSearchTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moviesSearchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MoviesSearchText = AutoDisposeNotifier<String>;
String _$moviesControllerHash() => r'd4cb30bb26b618794a517af28b92282e5bfe79ba';

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

abstract class _$MoviesController
    extends BuildlessAutoDisposeAsyncNotifier<List<TMDBMovie>> {
  late final MoviesPagination pagination;

  FutureOr<List<TMDBMovie>> build({
    required MoviesPagination pagination,
  });
}

/// See also [MoviesController].
@ProviderFor(MoviesController)
const moviesControllerProvider = MoviesControllerFamily();

/// See also [MoviesController].
class MoviesControllerFamily extends Family<AsyncValue<List<TMDBMovie>>> {
  /// See also [MoviesController].
  const MoviesControllerFamily();

  /// See also [MoviesController].
  MoviesControllerProvider call({
    required MoviesPagination pagination,
  }) {
    return MoviesControllerProvider(
      pagination: pagination,
    );
  }

  @override
  MoviesControllerProvider getProviderOverride(
    covariant MoviesControllerProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
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
  String? get name => r'moviesControllerProvider';
}

/// See also [MoviesController].
class MoviesControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MoviesController, List<TMDBMovie>> {
  /// See also [MoviesController].
  MoviesControllerProvider({
    required this.pagination,
  }) : super.internal(
          () => MoviesController()..pagination = pagination,
          from: moviesControllerProvider,
          name: r'moviesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviesControllerHash,
          dependencies: MoviesControllerFamily._dependencies,
          allTransitiveDependencies:
              MoviesControllerFamily._allTransitiveDependencies,
        );

  final MoviesPagination pagination;

  @override
  bool operator ==(Object other) {
    return other is MoviesControllerProvider && other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<TMDBMovie>> runNotifierBuild(
    covariant MoviesController notifier,
  ) {
    return notifier.build(
      pagination: pagination,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
