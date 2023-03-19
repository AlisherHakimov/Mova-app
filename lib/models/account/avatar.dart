import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mova_app/models/account/gravatar.dart';
import 'package:mova_app/models/account/tmdb.dart';
part 'avatar.freezed.dart';
part 'avatar.g.dart';

@Freezed()
class Avatar with _$Avatar {
  const factory Avatar({
    required Gravatar gravatar,
    Tmdb? tmdb,
  }) = _Avatar;
  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
