import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_company.freezed.dart';
part 'production_company.g.dart';

@Freezed()
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required String name,
    required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'origin_country') required String originCountry,
  }) = _ProductionCompany;
  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}
