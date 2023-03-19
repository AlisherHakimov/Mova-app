// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  Gravatar get gravatar => throw _privateConstructorUsedError;
  Tmdb? get tmdb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({Gravatar gravatar, Tmdb? tmdb});

  $GravatarCopyWith<$Res> get gravatar;
  $TmdbCopyWith<$Res>? get tmdb;
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = null,
    Object? tmdb = freezed,
  }) {
    return _then(_value.copyWith(
      gravatar: null == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar,
      tmdb: freezed == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as Tmdb?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GravatarCopyWith<$Res> get gravatar {
    return $GravatarCopyWith<$Res>(_value.gravatar, (value) {
      return _then(_value.copyWith(gravatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TmdbCopyWith<$Res>? get tmdb {
    if (_value.tmdb == null) {
      return null;
    }

    return $TmdbCopyWith<$Res>(_value.tmdb!, (value) {
      return _then(_value.copyWith(tmdb: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AvatarCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$_AvatarCopyWith(_$_Avatar value, $Res Function(_$_Avatar) then) =
      __$$_AvatarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Gravatar gravatar, Tmdb? tmdb});

  @override
  $GravatarCopyWith<$Res> get gravatar;
  @override
  $TmdbCopyWith<$Res>? get tmdb;
}

/// @nodoc
class __$$_AvatarCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$_Avatar>
    implements _$$_AvatarCopyWith<$Res> {
  __$$_AvatarCopyWithImpl(_$_Avatar _value, $Res Function(_$_Avatar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = null,
    Object? tmdb = freezed,
  }) {
    return _then(_$_Avatar(
      gravatar: null == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar,
      tmdb: freezed == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as Tmdb?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Avatar implements _Avatar {
  const _$_Avatar({required this.gravatar, this.tmdb});

  factory _$_Avatar.fromJson(Map<String, dynamic> json) =>
      _$$_AvatarFromJson(json);

  @override
  final Gravatar gravatar;
  @override
  final Tmdb? tmdb;

  @override
  String toString() {
    return 'Avatar(gravatar: $gravatar, tmdb: $tmdb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Avatar &&
            (identical(other.gravatar, gravatar) ||
                other.gravatar == gravatar) &&
            (identical(other.tmdb, tmdb) || other.tmdb == tmdb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gravatar, tmdb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
      __$$_AvatarCopyWithImpl<_$_Avatar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvatarToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar({required final Gravatar gravatar, final Tmdb? tmdb}) =
      _$_Avatar;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$_Avatar.fromJson;

  @override
  Gravatar get gravatar;
  @override
  Tmdb? get tmdb;
  @override
  @JsonKey(ignore: true)
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
      throw _privateConstructorUsedError;
}
