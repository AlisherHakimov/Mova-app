// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spoken_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

/// @nodoc
mixin _$SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  String get langCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res, SpokenLanguage>;
  @useResult
  $Res call({@JsonKey(name: 'iso_639_1') String langCode, String name});
}

/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res, $Val extends SpokenLanguage>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langCode = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      langCode: null == langCode
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpokenLanguageCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$$_SpokenLanguageCopyWith(
          _$_SpokenLanguage value, $Res Function(_$_SpokenLanguage) then) =
      __$$_SpokenLanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'iso_639_1') String langCode, String name});
}

/// @nodoc
class __$$_SpokenLanguageCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res, _$_SpokenLanguage>
    implements _$$_SpokenLanguageCopyWith<$Res> {
  __$$_SpokenLanguageCopyWithImpl(
      _$_SpokenLanguage _value, $Res Function(_$_SpokenLanguage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langCode = null,
    Object? name = null,
  }) {
    return _then(_$_SpokenLanguage(
      langCode: null == langCode
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpokenLanguage implements _SpokenLanguage {
  const _$_SpokenLanguage(
      {@JsonKey(name: 'iso_639_1') required this.langCode, required this.name});

  factory _$_SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$$_SpokenLanguageFromJson(json);

  @override
  @JsonKey(name: 'iso_639_1')
  final String langCode;
  @override
  final String name;

  @override
  String toString() {
    return 'SpokenLanguage(langCode: $langCode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpokenLanguage &&
            (identical(other.langCode, langCode) ||
                other.langCode == langCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, langCode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpokenLanguageCopyWith<_$_SpokenLanguage> get copyWith =>
      __$$_SpokenLanguageCopyWithImpl<_$_SpokenLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpokenLanguageToJson(
      this,
    );
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  const factory _SpokenLanguage(
      {@JsonKey(name: 'iso_639_1') required final String langCode,
      required final String name}) = _$_SpokenLanguage;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$_SpokenLanguage.fromJson;

  @override
  @JsonKey(name: 'iso_639_1')
  String get langCode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SpokenLanguageCopyWith<_$_SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
