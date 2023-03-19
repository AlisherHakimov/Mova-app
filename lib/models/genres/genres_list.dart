import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mova_app/models/genres/genre.dart';
part 'genres_list.freezed.dart';
part 'genres_list.g.dart';

@Freezed()
class GenresList with _$GenresList {
  const factory GenresList({
    required List<Genre> genres,
  }) = _GenresList;
  factory GenresList.fromJson(Map<String, dynamic> json) =>
      _$GenresListFromJson(json);
}
