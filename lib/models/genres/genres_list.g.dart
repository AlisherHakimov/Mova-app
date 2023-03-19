// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenresList _$$_GenresListFromJson(Map<String, dynamic> json) =>
    _$_GenresList(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GenresListToJson(_$_GenresList instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
