// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Videos _$$_VideosFromJson(Map<String, dynamic> json) => _$_Videos(
      id: json['id'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideosToJson(_$_Videos instance) => <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
