import 'package:intl/intl.dart';

class DateFormatters {
  static String dateTimeToNasaDateString(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
}
