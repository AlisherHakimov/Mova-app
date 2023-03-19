import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@Freezed()
class Video with _$Video {
  const factory Video({
    @JsonKey(name: 'iso_639_1') required String langCode,
    @JsonKey(name: 'iso_3166_1') required String countryCode,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    @JsonKey(name: 'published_at') required String publishedAt,
    required String id,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
