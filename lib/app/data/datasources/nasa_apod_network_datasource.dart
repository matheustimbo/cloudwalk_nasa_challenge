import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';

abstract class NasaApodNetworkDatasource {
  Future<List<NasaApod>> getNasaApodsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  );
  Future<NasaApod> getNasaApodFromDate(DateTime date);
}
