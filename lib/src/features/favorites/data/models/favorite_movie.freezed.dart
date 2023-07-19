// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteMovie _$FavoriteMovieFromJson(Map<String, dynamic> json) {
  return _FavoriteMovie.fromJson(json);
}

/// @nodoc
mixin _$FavoriteMovie {
  String get uuid => throw _privateConstructorUsedError;
  TMDBMovie get movie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteMovieCopyWith<FavoriteMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMovieCopyWith<$Res> {
  factory $FavoriteMovieCopyWith(
          FavoriteMovie value, $Res Function(FavoriteMovie) then) =
      _$FavoriteMovieCopyWithImpl<$Res, FavoriteMovie>;
  @useResult
  $Res call({String uuid, TMDBMovie movie});

  $TMDBMovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$FavoriteMovieCopyWithImpl<$Res, $Val extends FavoriteMovie>
    implements $FavoriteMovieCopyWith<$Res> {
  _$FavoriteMovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? movie = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as TMDBMovie,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TMDBMovieCopyWith<$Res> get movie {
    return $TMDBMovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FavoriteMovieCopyWith<$Res>
    implements $FavoriteMovieCopyWith<$Res> {
  factory _$$_FavoriteMovieCopyWith(
          _$_FavoriteMovie value, $Res Function(_$_FavoriteMovie) then) =
      __$$_FavoriteMovieCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, TMDBMovie movie});

  @override
  $TMDBMovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$_FavoriteMovieCopyWithImpl<$Res>
    extends _$FavoriteMovieCopyWithImpl<$Res, _$_FavoriteMovie>
    implements _$$_FavoriteMovieCopyWith<$Res> {
  __$$_FavoriteMovieCopyWithImpl(
      _$_FavoriteMovie _value, $Res Function(_$_FavoriteMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? movie = null,
  }) {
    return _then(_$_FavoriteMovie(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as TMDBMovie,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteMovie implements _FavoriteMovie {
  _$_FavoriteMovie({required this.uuid, required this.movie});

  factory _$_FavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteMovieFromJson(json);

  @override
  final String uuid;
  @override
  final TMDBMovie movie;

  @override
  String toString() {
    return 'FavoriteMovie(uuid: $uuid, movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteMovie &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, movie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteMovieCopyWith<_$_FavoriteMovie> get copyWith =>
      __$$_FavoriteMovieCopyWithImpl<_$_FavoriteMovie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteMovieToJson(
      this,
    );
  }
}

abstract class _FavoriteMovie implements FavoriteMovie {
  factory _FavoriteMovie(
      {required final String uuid,
      required final TMDBMovie movie}) = _$_FavoriteMovie;

  factory _FavoriteMovie.fromJson(Map<String, dynamic> json) =
      _$_FavoriteMovie.fromJson;

  @override
  String get uuid;
  @override
  TMDBMovie get movie;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteMovieCopyWith<_$_FavoriteMovie> get copyWith =>
      throw _privateConstructorUsedError;
}
