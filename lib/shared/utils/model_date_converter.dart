import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateConverter implements JsonConverter<DateTime?, String> {
  const DateConverter();

  @override
  DateTime? fromJson(String dateString) {
    if (dateString.isEmpty) {
      return null;
    }
    return DateTime.parse(dateString);
  }

  @override
  String toJson(DateTime? date) =>
      date == null ? "" : DateFormatters.dateTimeToNasaDateString(date);
}
