// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_apod.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NasaApodImplAdapter extends TypeAdapter<_$NasaApodImpl> {
  @override
  final int typeId = 1;

  @override
  _$NasaApodImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NasaApodImpl(
      copyright: fields[1] as String?,
      url: fields[2] as String,
      title: fields[3] as String,
      hdurl: fields[4] as String?,
      mediaType: fields[5] as String,
      date: fields[6] as DateTime,
      explanation: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$NasaApodImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.copyright)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.hdurl)
      ..writeByte(5)
      ..write(obj.mediaType)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.explanation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NasaApodImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$$NasaApodImplToJson(_$NasaApodImpl instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'url': instance.url,
      'title': instance.title,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'date': instance.date.toIso8601String(),
      'explanation': instance.explanation,
    };
