// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountrySummaryModelImpl _$$CountrySummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountrySummaryModelImpl(
      name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
      flags: FlagsModel.fromJson(json['flags'] as Map<String, dynamic>),
      population: (json['population'] as num).toInt(),
      code: json['cca2'] as String,
    );

Map<String, dynamic> _$$CountrySummaryModelImplToJson(
        _$CountrySummaryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
      'population': instance.population,
      'cca2': instance.code,
    };

_$NameModelImpl _$$NameModelImplFromJson(Map<String, dynamic> json) =>
    _$NameModelImpl(
      common: json['common'] as String,
      official: json['official'] as String?,
    );

Map<String, dynamic> _$$NameModelImplToJson(_$NameModelImpl instance) =>
    <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };

_$FlagsModelImpl _$$FlagsModelImplFromJson(Map<String, dynamic> json) =>
    _$FlagsModelImpl(
      png: json['png'] as String?,
      svg: json['svg'] as String?,
    );

Map<String, dynamic> _$$FlagsModelImplToJson(_$FlagsModelImpl instance) =>
    <String, dynamic>{
      'png': instance.png,
      'svg': instance.svg,
    };
