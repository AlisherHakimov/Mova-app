// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credits _$$_CreditsFromJson(Map<String, dynamic> json) => _$_Credits(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CreditsToJson(_$_Credits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
