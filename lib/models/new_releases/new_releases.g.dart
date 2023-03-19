// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_releases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewReleases _$$_NewReleasesFromJson(Map<String, dynamic> json) =>
    _$_NewReleases(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: Dates.fromJson(json['dates'] as Map<String, dynamic>),
      totalResults: json['totalResults'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$$_NewReleasesToJson(_$_NewReleases instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
    };
