// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_movies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteMoviesResponse _$FavoriteMoviesResponseFromJson(
    Map<String, dynamic> json) {
  return _FavoriteMoviesResponse.fromJson(json);
}

/// @nodoc
mixin _$FavoriteMoviesResponse {
  List<FavoriteMovie> get results => throw _privateConstructorUsedError;
  List<String> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteMoviesResponseCopyWith<FavoriteMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMoviesResponseCopyWith<$Res> {
  factory $FavoriteMoviesResponseCopyWith(FavoriteMoviesResponse value,
          $Res Function(FavoriteMoviesResponse) then) =
      _$FavoriteMoviesResponseCopyWithImpl<$Res, FavoriteMoviesResponse>;
  @useResult
  $Res call({List<FavoriteMovie> results, List<String> errors});
}

/// @nodoc
class _$FavoriteMoviesResponseCopyWithImpl<$Res,
        $Val extends FavoriteMoviesResponse>
    implements $FavoriteMoviesResponseCopyWith<$Res> {
  _$FavoriteMoviesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FavoriteMovie>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteMoviesResponseCopyWith<$Res>
    implements $FavoriteMoviesResponseCopyWith<$Res> {
  factory _$$_FavoriteMoviesResponseCopyWith(_$_FavoriteMoviesResponse value,
          $Res Function(_$_FavoriteMoviesResponse) then) =
      __$$_FavoriteMoviesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FavoriteMovie> results, List<String> errors});
}

/// @nodoc
class __$$_FavoriteMoviesResponseCopyWithImpl<$Res>
    extends _$FavoriteMoviesResponseCopyWithImpl<$Res,
        _$_FavoriteMoviesResponse>
    implements _$$_FavoriteMoviesResponseCopyWith<$Res> {
  __$$_FavoriteMoviesResponseCopyWithImpl(_$_FavoriteMoviesResponse _value,
      $Res Function(_$_FavoriteMoviesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? errors = null,
  }) {
    return _then(_$_FavoriteMoviesResponse(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FavoriteMovie>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteMoviesResponse implements _FavoriteMoviesResponse {
  _$_FavoriteMoviesResponse(
      {required final List<FavoriteMovie> results,
      final List<String> errors = const []})
      : _results = results,
        _errors = errors;

  factory _$_FavoriteMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteMoviesResponseFromJson(json);

  final List<FavoriteMovie> _results;
  @override
  List<FavoriteMovie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  final List<String> _errors;
  @override
  @JsonKey()
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'FavoriteMoviesResponse(results: $results, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteMoviesResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteMoviesResponseCopyWith<_$_FavoriteMoviesResponse> get copyWith =>
      __$$_FavoriteMoviesResponseCopyWithImpl<_$_FavoriteMoviesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteMoviesResponseToJson(
      this,
    );
  }
}

abstract class _FavoriteMoviesResponse implements FavoriteMoviesResponse {
  factory _FavoriteMoviesResponse(
      {required final List<FavoriteMovie> results,
      final List<String> errors}) = _$_FavoriteMoviesResponse;

  factory _FavoriteMoviesResponse.fromJson(Map<String, dynamic> json) =
      _$_FavoriteMoviesResponse.fromJson;

  @override
  List<FavoriteMovie> get results;
  @override
  List<String> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteMoviesResponseCopyWith<_$_FavoriteMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
