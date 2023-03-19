// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lists _$ListsFromJson(Map<String, dynamic> json) {
  return _Lists.fromJson(json);
}

/// @nodoc
mixin _$Lists {
  int get page => throw _privateConstructorUsedError;
  List<CreatedList> get results => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListsCopyWith<Lists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsCopyWith<$Res> {
  factory $ListsCopyWith(Lists value, $Res Function(Lists) then) =
      _$ListsCopyWithImpl<$Res, Lists>;
  @useResult
  $Res call(
      {int page, List<CreatedList> results, int totalResults, int totalPages});
}

/// @nodoc
class _$ListsCopyWithImpl<$Res, $Val extends Lists>
    implements $ListsCopyWith<$Res> {
  _$ListsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
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
              as List<CreatedList>,
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
}

/// @nodoc
abstract class _$$_ListsCopyWith<$Res> implements $ListsCopyWith<$Res> {
  factory _$$_ListsCopyWith(_$_Lists value, $Res Function(_$_Lists) then) =
      __$$_ListsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, List<CreatedList> results, int totalResults, int totalPages});
}

/// @nodoc
class __$$_ListsCopyWithImpl<$Res> extends _$ListsCopyWithImpl<$Res, _$_Lists>
    implements _$$_ListsCopyWith<$Res> {
  __$$_ListsCopyWithImpl(_$_Lists _value, $Res Function(_$_Lists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalResults = null,
    Object? totalPages = null,
  }) {
    return _then(_$_Lists(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CreatedList>,
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
class _$_Lists implements _Lists {
  const _$_Lists(
      {required this.page,
      required final List<CreatedList> results,
      required this.totalResults,
      required this.totalPages})
      : _results = results;

  factory _$_Lists.fromJson(Map<String, dynamic> json) =>
      _$$_ListsFromJson(json);

  @override
  final int page;
  final List<CreatedList> _results;
  @override
  List<CreatedList> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalResults;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'Lists(page: $page, results: $results, totalResults: $totalResults, totalPages: $totalPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lists &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalResults, totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListsCopyWith<_$_Lists> get copyWith =>
      __$$_ListsCopyWithImpl<_$_Lists>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListsToJson(
      this,
    );
  }
}

abstract class _Lists implements Lists {
  const factory _Lists(
      {required final int page,
      required final List<CreatedList> results,
      required final int totalResults,
      required final int totalPages}) = _$_Lists;

  factory _Lists.fromJson(Map<String, dynamic> json) = _$_Lists.fromJson;

  @override
  int get page;
  @override
  List<CreatedList> get results;
  @override
  int get totalResults;
  @override
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$_ListsCopyWith<_$_Lists> get copyWith =>
      throw _privateConstructorUsedError;
}
