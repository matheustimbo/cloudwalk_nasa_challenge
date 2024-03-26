import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:hive/hive.dart';

class NasaApodLocalDatasourceImpl implements NasaApodLocalDatasource {
  final Box<NasaApod> nasaApodHiveBox;

  NasaApodLocalDatasourceImpl(this.nasaApodHiveBox);

  @override
  NasaApod? getNasaApodByDateFromLocalDatabase(DateTime date) {
    return nasaApodHiveBox.get(DateFormatters.dateTimeToNasaDateString(date));
  }

  @override
  Future<void> saveNasaApodOnLocalDatabase(NasaApod nasaApod) {
    return nasaApodHiveBox.put(
        DateFormatters.dateTimeToNasaDateString(nasaApod.date), nasaApod);
  }
}
