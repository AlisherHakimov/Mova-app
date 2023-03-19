import 'package:freezed_annotation/freezed_annotation.dart';

import 'avatar.dart';
part 'account_details.freezed.dart';
part 'account_details.g.dart';

@Freezed()
class AccountDetails with _$AccountDetails {
  const factory AccountDetails({
    required Avatar avatar,
    required int id,
    @JsonKey(name: 'iso_639_1') required String langCode,
    @JsonKey(name: 'iso_3166_1') required String countryCode,
    required String name,
    @JsonKey(name: 'include_adult') required bool includeAdult,
    required String username,
  }) = _AccountDetails;
  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);
}
