// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteMoviesResponse _$$_FavoriteMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FavoriteMoviesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => FavoriteMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FavoriteMoviesResponseToJson(
        _$_FavoriteMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'errors': instance.errors,
    };
