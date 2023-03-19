import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_list.freezed.dart';
part 'created_list.g.dart';

@Freezed()
class CreatedList with _$CreatedList {
  const factory CreatedList({
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'favorite_count') required int favoriteCount,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'item_count') required int itemCount,
    @JsonKey(name: 'iso_639_1') required String langCode,
    @JsonKey(name: 'list_type') required String listType,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'poster_path') String? posterPath,
  }) = _CreatedList;

  factory CreatedList.fromJson(Map<String, dynamic> json) =>
      _$CreatedListFromJson(json);
}
