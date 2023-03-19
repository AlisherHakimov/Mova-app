import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mova_app/models/videos/video.dart';

part 'videos.freezed.dart';
part 'videos.g.dart';

@Freezed()
class Videos with _$Videos {
  const factory Videos({
    required int id,
    required List<Video> results,
  }) = _Videos;

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
}
