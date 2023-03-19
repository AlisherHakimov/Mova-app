import 'package:freezed_annotation/freezed_annotation.dart';
part 'spoken_language.freezed.dart';
part 'spoken_language.g.dart';

@Freezed()
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'iso_639_1') required String langCode,
    required String name,
  }) = _SpokenLanguage;
  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
