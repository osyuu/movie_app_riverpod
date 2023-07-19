// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteMovie _$$_FavoriteMovieFromJson(Map<String, dynamic> json) =>
    _$_FavoriteMovie(
      uuid: json['uuid'] as String,
      movie: TMDBMovie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FavoriteMovieToJson(_$_FavoriteMovie instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'movie': instance.movie,
    };
