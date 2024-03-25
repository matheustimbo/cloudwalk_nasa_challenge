import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:dio/dio.dart';

class NasaApodNetworkDatasourceImpl implements NasaApodNetworkDatasource {
  final Dio dio;

  NasaApodNetworkDatasourceImpl(this.dio);

  @override
  Future<List<NasaApod>> getNasaApodsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final response = await dio.get(
      '/planetary/apod',
      queryParameters: {
        'start_date': DateFormatters.dateTimeToNasaDateString(startDate),
        'end_date': DateFormatters.dateTimeToNasaDateString(endDate),
      },
    );

    return (response.data as List).map((e) => NasaApod.fromJson(e)).toList();
  }

  @override
  Future<NasaApod> getNasaApodFromDate(DateTime date) async {
    final response = await dio.get(
      '/planetary/apod',
      queryParameters: {
        'date': DateFormatters.dateTimeToNasaDateString(date),
      },
    );

    return NasaApod.fromJson(response.data);
  }
}
