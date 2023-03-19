import 'package:freezed_annotation/freezed_annotation.dart';

import '../movie/movie.dart';
part 'my_list_details.freezed.dart';
part 'my_list_details.g.dart';

@Freezed()
class MyListDetails with _$MyListDetails {
  const factory MyListDetails({
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'favorite_count') required int favoriteCount,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'items') List<Movie>? items,
    @JsonKey(name: 'item_count') required int itemCount,
    @JsonKey(name: 'iso_639_1') required String langCode,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'poster_path') String? posterPath,
  }) = _MyListDetails;

  factory MyListDetails.fromJson(Map<String, dynamic> json) =>
      _$MyListDetailsFromJson(json);
}
