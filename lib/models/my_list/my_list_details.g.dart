// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyListDetails _$$_MyListDetailsFromJson(Map<String, dynamic> json) =>
    _$_MyListDetails(
      createdBy: json['created_by'] as String,
      description: json['description'] as String,
      favoriteCount: json['favorite_count'] as int,
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCount: json['item_count'] as int,
      langCode: json['iso_639_1'] as String,
      name: json['name'] as String,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_MyListDetailsToJson(_$_MyListDetails instance) =>
    <String, dynamic>{
      'created_by': instance.createdBy,
      'description': instance.description,
      'favorite_count': instance.favoriteCount,
      'id': instance.id,
      'items': instance.items,
      'item_count': instance.itemCount,
      'iso_639_1': instance.langCode,
      'name': instance.name,
      'poster_path': instance.posterPath,
    };
