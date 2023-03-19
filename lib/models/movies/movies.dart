import 'package:freezed_annotation/freezed_annotation.dart';

import '../movie/movie.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@Freezed()
class Movies with _$Movies {
  const factory Movies({
    required int page,
    required List<Movie> results,
    required int totalResults,
    required int totalPages,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
