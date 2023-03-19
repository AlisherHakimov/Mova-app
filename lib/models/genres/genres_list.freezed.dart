// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genres_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenresList _$GenresListFromJson(Map<String, dynamic> json) {
  return _GenresList.fromJson(json);
}

/// @nodoc
mixin _$GenresList {
  List<Genre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenresListCopyWith<GenresList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresListCopyWith<$Res> {
  factory $GenresListCopyWith(
          GenresList value, $Res Function(GenresList) then) =
      _$GenresListCopyWithImpl<$Res, GenresList>;
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenresListCopyWithImpl<$Res, $Val extends GenresList>
    implements $GenresListCopyWith<$Res> {
  _$GenresListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenresListCopyWith<$Res>
    implements $GenresListCopyWith<$Res> {
  factory _$$_GenresListCopyWith(
          _$_GenresList value, $Res Function(_$_GenresList) then) =
      __$$_GenresListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class __$$_GenresListCopyWithImpl<$Res>
    extends _$GenresListCopyWithImpl<$Res, _$_GenresList>
    implements _$$_GenresListCopyWith<$Res> {
  __$$_GenresListCopyWithImpl(
      _$_GenresList _value, $Res Function(_$_GenresList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$_GenresList(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenresList implements _GenresList {
  const _$_GenresList({required final List<Genre> genres}) : _genres = genres;

  factory _$_GenresList.fromJson(Map<String, dynamic> json) =>
      _$$_GenresListFromJson(json);

  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenresList(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenresList &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenresListCopyWith<_$_GenresList> get copyWith =>
      __$$_GenresListCopyWithImpl<_$_GenresList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenresListToJson(
      this,
    );
  }
}

abstract class _GenresList implements GenresList {
  const factory _GenresList({required final List<Genre> genres}) =
      _$_GenresList;

  factory _GenresList.fromJson(Map<String, dynamic> json) =
      _$_GenresList.fromJson;

  @override
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$_GenresListCopyWith<_$_GenresList> get copyWith =>
      throw _privateConstructorUsedError;
}
