// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) {
  return _AccountDetails.fromJson(json);
}

/// @nodoc
mixin _$AccountDetails {
  Avatar get avatar => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String get langCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_3166_1')
  String get countryCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_adult')
  bool get includeAdult => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDetailsCopyWith<AccountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsCopyWith<$Res> {
  factory $AccountDetailsCopyWith(
          AccountDetails value, $Res Function(AccountDetails) then) =
      _$AccountDetailsCopyWithImpl<$Res, AccountDetails>;
  @useResult
  $Res call(
      {Avatar avatar,
      int id,
      @JsonKey(name: 'iso_639_1') String langCode,
      @JsonKey(name: 'iso_3166_1') String countryCode,
      String name,
      @JsonKey(name: 'include_adult') bool includeAdult,
      String username});

  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class _$AccountDetailsCopyWithImpl<$Res, $Val extends AccountDetails>
    implements $AccountDetailsCopyWith<$Res> {
  _$AccountDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
    Object? id = null,
    Object? langCode = null,
    Object? countryCode = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      langCode: null == langCode
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res> get avatar {
    return $AvatarCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountDetailsCopyWith<$Res>
    implements $AccountDetailsCopyWith<$Res> {
  factory _$$_AccountDetailsCopyWith(
          _$_AccountDetails value, $Res Function(_$_AccountDetails) then) =
      __$$_AccountDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Avatar avatar,
      int id,
      @JsonKey(name: 'iso_639_1') String langCode,
      @JsonKey(name: 'iso_3166_1') String countryCode,
      String name,
      @JsonKey(name: 'include_adult') bool includeAdult,
      String username});

  @override
  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$_AccountDetailsCopyWithImpl<$Res>
    extends _$AccountDetailsCopyWithImpl<$Res, _$_AccountDetails>
    implements _$$_AccountDetailsCopyWith<$Res> {
  __$$_AccountDetailsCopyWithImpl(
      _$_AccountDetails _value, $Res Function(_$_AccountDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
    Object? id = null,
    Object? langCode = null,
    Object? countryCode = null,
    Object? name = null,
    Object? includeAdult = null,
    Object? username = null,
  }) {
    return _then(_$_AccountDetails(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      langCode: null == langCode
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDetails implements _AccountDetails {
  const _$_AccountDetails(
      {required this.avatar,
      required this.id,
      @JsonKey(name: 'iso_639_1') required this.langCode,
      @JsonKey(name: 'iso_3166_1') required this.countryCode,
      required this.name,
      @JsonKey(name: 'include_adult') required this.includeAdult,
      required this.username});

  factory _$_AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDetailsFromJson(json);

  @override
  final Avatar avatar;
  @override
  final int id;
  @override
  @JsonKey(name: 'iso_639_1')
  final String langCode;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String countryCode;
  @override
  final String name;
  @override
  @JsonKey(name: 'include_adult')
  final bool includeAdult;
  @override
  final String username;

  @override
  String toString() {
    return 'AccountDetails(avatar: $avatar, id: $id, langCode: $langCode, countryCode: $countryCode, name: $name, includeAdult: $includeAdult, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDetails &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.langCode, langCode) ||
                other.langCode == langCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatar, id, langCode,
      countryCode, name, includeAdult, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDetailsCopyWith<_$_AccountDetails> get copyWith =>
      __$$_AccountDetailsCopyWithImpl<_$_AccountDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDetailsToJson(
      this,
    );
  }
}

abstract class _AccountDetails implements AccountDetails {
  const factory _AccountDetails(
      {required final Avatar avatar,
      required final int id,
      @JsonKey(name: 'iso_639_1') required final String langCode,
      @JsonKey(name: 'iso_3166_1') required final String countryCode,
      required final String name,
      @JsonKey(name: 'include_adult') required final bool includeAdult,
      required final String username}) = _$_AccountDetails;

  factory _AccountDetails.fromJson(Map<String, dynamic> json) =
      _$_AccountDetails.fromJson;

  @override
  Avatar get avatar;
  @override
  int get id;
  @override
  @JsonKey(name: 'iso_639_1')
  String get langCode;
  @override
  @JsonKey(name: 'iso_3166_1')
  String get countryCode;
  @override
  String get name;
  @override
  @JsonKey(name: 'include_adult')
  bool get includeAdult;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDetailsCopyWith<_$_AccountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
