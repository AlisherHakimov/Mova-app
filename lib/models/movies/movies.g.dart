// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movies _$$_MoviesFromJson(Map<String, dynamic> json) => _$_Movies(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$$_MoviesToJson(_$_Movies instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
    };
