import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication.freezed.dart';
part 'authentication.g.dart';

@Freezed()
class Authentication with _$Authentication {
  const factory Authentication({
    required bool success,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'request_token') required String requestToken,
  }) = _Authentication;
  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);
}
