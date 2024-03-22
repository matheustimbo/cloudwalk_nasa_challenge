// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NasaApodImpl _$$NasaApodImplFromJson(Map<String, dynamic> json) =>
    _$NasaApodImpl(
      copyright: json['copyright'] as String?,
      url: json['url'] as String,
      title: json['title'] as String,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NasaApodImplToJson(_$NasaApodImpl instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'url': instance.url,
      'title': instance.title,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'date': instance.date.toIso8601String(),
    };
