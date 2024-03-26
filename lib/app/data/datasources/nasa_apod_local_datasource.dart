import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';

abstract class NasaApodLocalDatasource {
  NasaApod? getNasaApodByDateFromLocalDatabase(
    DateTime date,
  );
  Future<void> saveNasaApodOnLocalDatabase(NasaApod nasaApod);
}
