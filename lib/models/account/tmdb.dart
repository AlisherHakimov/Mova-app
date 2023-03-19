import 'package:freezed_annotation/freezed_annotation.dart';
part 'tmdb.freezed.dart';
part 'tmdb.g.dart';

@Freezed()
class Tmdb with _$Tmdb {
  const factory Tmdb({
    @JsonKey(name: 'avatar_path') required String avatarPath,
  }) = _Tmdb;
  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
}
