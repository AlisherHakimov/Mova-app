// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_releases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewReleases _$NewReleasesFromJson(Map<String, dynamic> json) {
  return _NewReleases.fromJson(json);
}

/// @nodoc
mixin _$NewReleases {
  int get page => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;
  Dates get dates => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewReleasesCopyWith<NewReleases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReleasesCopyWith<$Res> {
  factory $NewReleasesCopyWith(
          NewReleases value, $Res Function(NewReleases) then) =
      _$NewReleasesCopyWithImpl<$Res, NewReleases>;
  @useResult
  $Res call(
      {int page,
      List<Movie> results,
      Dates dates,
      int totalResults,
      int totalPages});

  $DatesCopyWith<$Res> get dates;
}

/// @nodoc
class _$NewReleasesCopyWithImpl<$Res, $Val extends NewReleases>
    implements $NewReleasesCopyWith<$Res> {
  _$NewReleasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? dates = null,
    Object? totalResults = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Dates,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DatesCopyWith<$Res> get dates {
    return $DatesCopyWith<$Res>(_value.dates, (value) {
      return _then(_value.copyWith(dates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewReleasesCopyWith<$Res>
    implements $NewReleasesCopyWith<$Res> {
  factory _$$_NewReleasesCopyWith(
          _$_NewReleases value, $Res Function(_$_NewReleases) then) =
      __$$_NewReleasesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<Movie> results,
      Dates dates,
      int totalResults,
      int totalPages});

  @override
  $DatesCopyWith<$Res> get dates;
}

/// @nodoc
class __$$_NewReleasesCopyWithImpl<$Res>
    extends _$NewReleasesCopyWithImpl<$Res, _$_NewReleases>
    implements _$$_NewReleasesCopyWith<$Res> {
  __$$_NewReleasesCopyWithImpl(
      _$_NewReleases _value, $Res Function(_$_NewReleases) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? dates = null,
    Object? totalResults = null,
    Object? totalPages = null,
  }) {
    return _then(_$_NewReleases(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Dates,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewReleases implements _NewReleases {
  const _$_NewReleases(
      {required this.page,
      required final List<Movie> results,
      required this.dates,
      required this.totalResults,
      required this.totalPages})
      : _results = results;

  factory _$_NewReleases.fromJson(Map<String, dynamic> json) =>
      _$$_NewReleasesFromJson(json);

  @override
  final int page;
  final List<Movie> _results;
  @override
  List<Movie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final Dates dates;
  @override
  final int totalResults;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'NewReleases(page: $page, results: $results, dates: $dates, totalResults: $totalResults, totalPages: $totalPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewReleases &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.dates, dates) || other.dates == dates) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      const DeepCollectionEquality().hash(_results),
      dates,
      totalResults,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewReleasesCopyWith<_$_NewReleases> get copyWith =>
      __$$_NewReleasesCopyWithImpl<_$_NewReleases>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewReleasesToJson(
      this,
    );
  }
}

abstract class _NewReleases implements NewReleases {
  const factory _NewReleases(
      {required final int page,
      required final List<Movie> results,
      required final Dates dates,
      required final int totalResults,
      required final int totalPages}) = _$_NewReleases;

  factory _NewReleases.fromJson(Map<String, dynamic> json) =
      _$_NewReleases.fromJson;

  @override
  int get page;
  @override
  List<Movie> get results;
  @override
  Dates get dates;
  @override
  int get totalResults;
  @override
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$_NewReleasesCopyWith<_$_NewReleases> get copyWith =>
      throw _privateConstructorUsedError;
}
