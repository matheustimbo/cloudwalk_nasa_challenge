// ignore_for_file: invalid_annotation_target

import 'package:cloudwalk_nasa_challenge/shared/utils/model_date_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nasa_apod.freezed.dart';
part 'nasa_apod.g.dart';

@freezed
class NasaApod with _$NasaApod {
  factory NasaApod({
    String? copyright,
    required String url,
    required String title,
    String? hdurl,
    @JsonKey(name: 'media_type') required String mediaType,
    @DateConverter() required DateTime date,
  }) = _NasaApod;

  factory NasaApod.fromJson(Map<String, dynamic> json) =>
      _$NasaApodFromJson(json);
}
