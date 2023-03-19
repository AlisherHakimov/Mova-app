// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreatedList _$$_CreatedListFromJson(Map<String, dynamic> json) =>
    _$_CreatedList(
      description: json['description'] as String,
      favoriteCount: json['favorite_count'] as int,
      id: json['id'] as int,
      itemCount: json['item_count'] as int,
      langCode: json['iso_639_1'] as String,
      listType: json['list_type'] as String,
      name: json['name'] as String,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_CreatedListToJson(_$_CreatedList instance) =>
    <String, dynamic>{
      'description': instance.description,
      'favorite_count': instance.favoriteCount,
      'id': instance.id,
      'item_count': instance.itemCount,
      'iso_639_1': instance.langCode,
      'list_type': instance.listType,
      'name': instance.name,
      'poster_path': instance.posterPath,
    };
