// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_movie_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteMovieEntity {
  String get uuid => throw _privateConstructorUsedError;
  TMDBMovieEntity get movie => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteMovieEntityCopyWith<FavoriteMovieEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMovieEntityCopyWith<$Res> {
  factory $FavoriteMovieEntityCopyWith(
          FavoriteMovieEntity value, $Res Function(FavoriteMovieEntity) then) =
      _$FavoriteMovieEntityCopyWithImpl<$Res, FavoriteMovieEntity>;
  @useResult
  $Res call({String uuid, TMDBMovieEntity movie});

  $TMDBMovieEntityCopyWith<$Res> get movie;
}

/// @nodoc
class _$FavoriteMovieEntityCopyWithImpl<$Res, $Val extends FavoriteMovieEntity>
    implements $FavoriteMovieEntityCopyWith<$Res> {
  _$FavoriteMovieEntityCopyWithImpl(this._value, this._then);

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
              as TMDBMovieEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TMDBMovieEntityCopyWith<$Res> get movie {
    return $TMDBMovieEntityCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FavoriteMovieEntityCopyWith<$Res>
    implements $FavoriteMovieEntityCopyWith<$Res> {
  factory _$$_FavoriteMovieEntityCopyWith(_$_FavoriteMovieEntity value,
          $Res Function(_$_FavoriteMovieEntity) then) =
      __$$_FavoriteMovieEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, TMDBMovieEntity movie});

  @override
  $TMDBMovieEntityCopyWith<$Res> get movie;
}

/// @nodoc
class __$$_FavoriteMovieEntityCopyWithImpl<$Res>
    extends _$FavoriteMovieEntityCopyWithImpl<$Res, _$_FavoriteMovieEntity>
    implements _$$_FavoriteMovieEntityCopyWith<$Res> {
  __$$_FavoriteMovieEntityCopyWithImpl(_$_FavoriteMovieEntity _value,
      $Res Function(_$_FavoriteMovieEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? movie = null,
  }) {
    return _then(_$_FavoriteMovieEntity(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as TMDBMovieEntity,
    ));
  }
}

/// @nodoc

class _$_FavoriteMovieEntity implements _FavoriteMovieEntity {
  _$_FavoriteMovieEntity({required this.uuid, required this.movie});

  @override
  final String uuid;
  @override
  final TMDBMovieEntity movie;

  @override
  String toString() {
    return 'FavoriteMovieEntity(uuid: $uuid, movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteMovieEntity &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, movie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteMovieEntityCopyWith<_$_FavoriteMovieEntity> get copyWith =>
      __$$_FavoriteMovieEntityCopyWithImpl<_$_FavoriteMovieEntity>(
          this, _$identity);
}

abstract class _FavoriteMovieEntity implements FavoriteMovieEntity {
  factory _FavoriteMovieEntity(
      {required final String uuid,
      required final TMDBMovieEntity movie}) = _$_FavoriteMovieEntity;

  @override
  String get uuid;
  @override
  TMDBMovieEntity get movie;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteMovieEntityCopyWith<_$_FavoriteMovieEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
