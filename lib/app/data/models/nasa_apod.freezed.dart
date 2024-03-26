// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nasa_apod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NasaApod _$NasaApodFromJson(Map<String, dynamic> json) {
  return _NasaApod.fromJson(json);
}

/// @nodoc
mixin _$NasaApod {
  @HiveField(1)
  String? get copyright => throw _privateConstructorUsedError;
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get hdurl => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'media_type')
  String get mediaType => throw _privateConstructorUsedError;
  @HiveField(6)
  @DateConverter()
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(7)
  String get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NasaApodCopyWith<NasaApod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NasaApodCopyWith<$Res> {
  factory $NasaApodCopyWith(NasaApod value, $Res Function(NasaApod) then) =
      _$NasaApodCopyWithImpl<$Res, NasaApod>;
  @useResult
  $Res call(
      {@HiveField(1) String? copyright,
      @HiveField(2) String url,
      @HiveField(3) String title,
      @HiveField(4) String? hdurl,
      @HiveField(5) @JsonKey(name: 'media_type') String mediaType,
      @HiveField(6) @DateConverter() DateTime date,
      @HiveField(7) String explanation});
}

/// @nodoc
class _$NasaApodCopyWithImpl<$Res, $Val extends NasaApod>
    implements $NasaApodCopyWith<$Res> {
  _$NasaApodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = freezed,
    Object? url = null,
    Object? title = null,
    Object? hdurl = freezed,
    Object? mediaType = null,
    Object? date = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hdurl: freezed == hdurl
          ? _value.hdurl
          : hdurl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NasaApodImplCopyWith<$Res>
    implements $NasaApodCopyWith<$Res> {
  factory _$$NasaApodImplCopyWith(
          _$NasaApodImpl value, $Res Function(_$NasaApodImpl) then) =
      __$$NasaApodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String? copyright,
      @HiveField(2) String url,
      @HiveField(3) String title,
      @HiveField(4) String? hdurl,
      @HiveField(5) @JsonKey(name: 'media_type') String mediaType,
      @HiveField(6) @DateConverter() DateTime date,
      @HiveField(7) String explanation});
}

/// @nodoc
class __$$NasaApodImplCopyWithImpl<$Res>
    extends _$NasaApodCopyWithImpl<$Res, _$NasaApodImpl>
    implements _$$NasaApodImplCopyWith<$Res> {
  __$$NasaApodImplCopyWithImpl(
      _$NasaApodImpl _value, $Res Function(_$NasaApodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = freezed,
    Object? url = null,
    Object? title = null,
    Object? hdurl = freezed,
    Object? mediaType = null,
    Object? date = null,
    Object? explanation = null,
  }) {
    return _then(_$NasaApodImpl(
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hdurl: freezed == hdurl
          ? _value.hdurl
          : hdurl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$NasaApodImpl extends _NasaApod {
  _$NasaApodImpl(
      {@HiveField(1) this.copyright,
      @HiveField(2) required this.url,
      @HiveField(3) required this.title,
      @HiveField(4) this.hdurl,
      @HiveField(5) @JsonKey(name: 'media_type') required this.mediaType,
      @HiveField(6) @DateConverter() required this.date,
      @HiveField(7) required this.explanation})
      : super._();

  factory _$NasaApodImpl.fromJson(Map<String, dynamic> json) =>
      _$$NasaApodImplFromJson(json);

  @override
  @HiveField(1)
  final String? copyright;
  @override
  @HiveField(2)
  final String url;
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String? hdurl;
  @override
  @HiveField(5)
  @JsonKey(name: 'media_type')
  final String mediaType;
  @override
  @HiveField(6)
  @DateConverter()
  final DateTime date;
  @override
  @HiveField(7)
  final String explanation;

  @override
  String toString() {
    return 'NasaApod(copyright: $copyright, url: $url, title: $title, hdurl: $hdurl, mediaType: $mediaType, date: $date, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NasaApodImpl &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hdurl, hdurl) || other.hdurl == hdurl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, copyright, url, title, hdurl, mediaType, date, explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NasaApodImplCopyWith<_$NasaApodImpl> get copyWith =>
      __$$NasaApodImplCopyWithImpl<_$NasaApodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NasaApodImplToJson(
      this,
    );
  }
}

abstract class _NasaApod extends NasaApod {
  factory _NasaApod(
      {@HiveField(1) final String? copyright,
      @HiveField(2) required final String url,
      @HiveField(3) required final String title,
      @HiveField(4) final String? hdurl,
      @HiveField(5)
      @JsonKey(name: 'media_type')
      required final String mediaType,
      @HiveField(6) @DateConverter() required final DateTime date,
      @HiveField(7) required final String explanation}) = _$NasaApodImpl;
  _NasaApod._() : super._();

  factory _NasaApod.fromJson(Map<String, dynamic> json) =
      _$NasaApodImpl.fromJson;

  @override
  @HiveField(1)
  String? get copyright;
  @override
  @HiveField(2)
  String get url;
  @override
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String? get hdurl;
  @override
  @HiveField(5)
  @JsonKey(name: 'media_type')
  String get mediaType;
  @override
  @HiveField(6)
  @DateConverter()
  DateTime get date;
  @override
  @HiveField(7)
  String get explanation;
  @override
  @JsonKey(ignore: true)
  _$$NasaApodImplCopyWith<_$NasaApodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
