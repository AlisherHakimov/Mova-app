import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mova_app/models/production_company/production_company.dart';
import 'package:mova_app/models/production_country/production_country.dart';

import '../credits/credits.dart';
import '../genres/genre.dart';
part 'details.freezed.dart';
part 'details.g.dart';

@Freezed()
class Details with _$Details {
  const factory Details({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'belongs_to_collection') Object? belongsToCollection,
    required int budget,
    required List<Genre> genres,
    @JsonKey(name: 'home_page') String? homePage,
    required int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies')
        required List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries')
        required List<ProductionCountry> productionCountries,
    @JsonKey(name: 'release_date') required String releaseDate,
    required int revenue,
    required int? runtime,
    required String status,
    String? tagline,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    required Credits credits,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}
