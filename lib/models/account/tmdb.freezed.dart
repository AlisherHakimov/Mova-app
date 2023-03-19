// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tmdb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tmdb _$TmdbFromJson(Map<String, dynamic> json) {
  return _Tmdb.fromJson(json);
}

/// @nodoc
mixin _$Tmdb {
  @JsonKey(name: 'avatar_path')
  String get avatarPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TmdbCopyWith<Tmdb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TmdbCopyWith<$Res> {
  factory $TmdbCopyWith(Tmdb value, $Res Function(Tmdb) then) =
      _$TmdbCopyWithImpl<$Res, Tmdb>;
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String avatarPath});
}

/// @nodoc
class _$TmdbCopyWithImpl<$Res, $Val extends Tmdb>
    implements $TmdbCopyWith<$Res> {
  _$TmdbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = null,
  }) {
    return _then(_value.copyWith(
      avatarPath: null == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TmdbCopyWith<$Res> implements $TmdbCopyWith<$Res> {
  factory _$$_TmdbCopyWith(_$_Tmdb value, $Res Function(_$_Tmdb) then) =
      __$$_TmdbCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String avatarPath});
}

/// @nodoc
class __$$_TmdbCopyWithImpl<$Res> extends _$TmdbCopyWithImpl<$Res, _$_Tmdb>
    implements _$$_TmdbCopyWith<$Res> {
  __$$_TmdbCopyWithImpl(_$_Tmdb _value, $Res Function(_$_Tmdb) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = null,
  }) {
    return _then(_$_Tmdb(
      avatarPath: null == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tmdb implements _Tmdb {
  const _$_Tmdb({@JsonKey(name: 'avatar_path') required this.avatarPath});

  factory _$_Tmdb.fromJson(Map<String, dynamic> json) => _$$_TmdbFromJson(json);

  @override
  @JsonKey(name: 'avatar_path')
  final String avatarPath;

  @override
  String toString() {
    return 'Tmdb(avatarPath: $avatarPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tmdb &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatarPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TmdbCopyWith<_$_Tmdb> get copyWith =>
      __$$_TmdbCopyWithImpl<_$_Tmdb>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TmdbToJson(
      this,
    );
  }
}

abstract class _Tmdb implements Tmdb {
  const factory _Tmdb(
          {@JsonKey(name: 'avatar_path') required final String avatarPath}) =
      _$_Tmdb;

  factory _Tmdb.fromJson(Map<String, dynamic> json) = _$_Tmdb.fromJson;

  @override
  @JsonKey(name: 'avatar_path')
  String get avatarPath;
  @override
  @JsonKey(ignore: true)
  _$$_TmdbCopyWith<_$_Tmdb> get copyWith => throw _privateConstructorUsedError;
}
