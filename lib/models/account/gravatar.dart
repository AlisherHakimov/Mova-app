import 'package:freezed_annotation/freezed_annotation.dart';
part 'gravatar.freezed.dart';
part 'gravatar.g.dart';

@Freezed()
class Gravatar with _$Gravatar {
  const factory Gravatar({
    required String hash,
  }) = _Gravatar;
  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}
