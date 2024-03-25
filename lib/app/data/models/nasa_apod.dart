// ignore_for_file: invalid_annotation_target

import 'package:cloudwalk_nasa_challenge/shared/utils/model_date_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'nasa_apod.freezed.dart';
part 'nasa_apod.g.dart';

@freezed
abstract class NasaApod extends HiveObject with _$NasaApod {
  NasaApod._();

  @HiveType(typeId: 1)
  factory NasaApod({
    @HiveField(1) String? copyright,
    @HiveField(2) required String url,
    @HiveField(3) required String title,
    @HiveField(4) String? hdurl,
    @HiveField(5) @JsonKey(name: 'media_type') required String mediaType,
    @HiveField(6) @DateConverter() required DateTime date,
  }) = _NasaApod;

  factory NasaApod.fromJson(Map<String, dynamic> json) =>
      _$NasaApodFromJson(json);
}
