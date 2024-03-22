import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NasaApodRepository {
  Future<Either<Failure, List<NasaApod>>> getNasaApodsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
