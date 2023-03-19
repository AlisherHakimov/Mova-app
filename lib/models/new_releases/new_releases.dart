import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mova_app/models/new_releases/dates.dart';

import '../movie/movie.dart';

part 'new_releases.freezed.dart';
part 'new_releases.g.dart';

@Freezed()
class NewReleases with _$NewReleases {
  const factory NewReleases({
    required int page,
    required List<Movie> results,
    required Dates dates,
    required int totalResults,
    required int totalPages,
  }) = _NewReleases;

  factory NewReleases.fromJson(Map<String, dynamic> json) =>
      _$NewReleasesFromJson(json);
}
