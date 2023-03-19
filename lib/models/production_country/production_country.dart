import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_country.freezed.dart';
part 'production_country.g.dart';

@Freezed()
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') required String countryCode,
    required String name,
  }) = _ProductionCountry;
  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}
