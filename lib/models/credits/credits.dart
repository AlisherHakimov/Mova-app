import 'package:freezed_annotation/freezed_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'credits.freezed.dart';
part 'credits.g.dart';

@Freezed()
class Credits with _$Credits {
  const factory Credits({
    required int id,
    required List<Cast> cast,
    required List<Crew> crew,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);
}
