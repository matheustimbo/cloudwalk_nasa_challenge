import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DateRange extends Equatable {
  final DateTime startDate;
  final DateTime endDate;

  const DateRange({
    required this.startDate,
    required this.endDate,
  });

  List<DateTime> getAllDatesBetween() {
    return [
      for (DateTime i = startDate;
          !DateUtils.isSameDay(i, endDate.add(const Duration(days: 1)));
          i = i.add(const Duration(days: 1)))
        i,
    ];
  }

  @override
  List<Object?> get props => [
        DateFormatters.dateTimeToNasaDateString(startDate),
        DateFormatters.dateTimeToNasaDateString(endDate),
      ];
}
