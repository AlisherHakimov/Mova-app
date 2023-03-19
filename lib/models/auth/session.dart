import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@Freezed()
class Session with _$Session {
  const factory Session({
    required bool success,
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _Session;
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
