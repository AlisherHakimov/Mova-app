// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductionCountry _$$_ProductionCountryFromJson(Map<String, dynamic> json) =>
    _$_ProductionCountry(
      countryCode: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_ProductionCountryToJson(
        _$_ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.countryCode,
      'name': instance.name,
    };
