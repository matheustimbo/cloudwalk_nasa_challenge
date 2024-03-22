import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NasaApodRepositoryImpl implements NasaApodRepository {
  final NasaApodNetworkDatasource nasaApodNetworkDatasource;

  NasaApodRepositoryImpl(this.nasaApodNetworkDatasource);

  @override
  Future<Either<Failure, List<NasaApod>>> getNasaApodsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      return Right(await nasaApodNetworkDatasource.getNasaApodsFromDateRange(
        startDate,
        endDate,
      ));
    } on DioException catch (e) {
      return Left(NasaApiFailure(e));
    }
  }
}
