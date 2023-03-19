import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@Freezed()
class Cast with _$Cast {
  const factory Cast({
    required bool adult,
    int? gender,
    required int id,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'original_name') required String originalName,
    required double popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'cast_id') required int castId,
    String? character,
    @JsonKey(name: 'credit_id') required String creditId,
    int? order,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
