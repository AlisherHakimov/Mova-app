import 'package:freezed_annotation/freezed_annotation.dart';

part 'regions.freezed.dart';
part 'regions.g.dart';

@Freezed()
class Region with _$Region {
  const factory Region({
    @JsonKey(name: 'iso_3166_1') required String countryCode,
    @JsonKey(name: 'english_name') required String name,
  }) = _Region;
  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
