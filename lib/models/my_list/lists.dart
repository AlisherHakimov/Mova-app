import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mova_app/models/my_list/created_list.dart';

part 'lists.freezed.dart';
part 'lists.g.dart';

@Freezed()
class Lists with _$Lists {
  const factory Lists({
    required int page,
    required List<CreatedList> results,
    required int totalResults,
    required int totalPages,
  }) = _Lists;

  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);
}
