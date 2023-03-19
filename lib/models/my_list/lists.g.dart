// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lists _$$_ListsFromJson(Map<String, dynamic> json) => _$_Lists(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => CreatedList.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$$_ListsToJson(_$_Lists instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
    };
