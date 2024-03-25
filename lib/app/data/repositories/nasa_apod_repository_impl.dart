import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NasaApodRepositoryImpl implements NasaApodRepository {
  final NasaApodNetworkDatasource nasaApodNetworkDatasource;
  final NasaApodLocalDatasource nasaApodLocalDatasource;

  NasaApodRepositoryImpl(
    this.nasaApodNetworkDatasource,
    this.nasaApodLocalDatasource,
  );

  @override
  Future<Either<Failure, List<NasaApod>>> getNasaApodsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final List<DateTime> allDatesToGet = [
      for (DateTime i = startDate;
          !DateUtils.isSameDay(i, endDate.add(const Duration(days: 1)));
          i = i.add(const Duration(days: 1)))
        i,
    ];
    List<NasaApod?> apodsOnLocal = allDatesToGet.map((DateTime date) {
      try {
        return nasaApodLocalDatasource.getNasaApodByDateFromLocalDatabase(date);
      } catch (_) {
        return null;
      }
    }).toList();
    final hasEveryDateOnLocal = apodsOnLocal.every((apod) => apod != null);
    if (hasEveryDateOnLocal) {
      List<NasaApod> apodsOnLocalSortedDesc =
          apodsOnLocal.whereType<NasaApod>().toList();
      apodsOnLocalSortedDesc.sort((a, b) => b.date.compareTo(a.date));
      return Right(apodsOnLocalSortedDesc);
    }
    final apodsRetrievedSuccessfullyFromLocal =
        apodsOnLocal.whereType<NasaApod>().toList();
    final datesOnLocal =
        apodsRetrievedSuccessfullyFromLocal.map((apod) => apod.date).toList();
    List<DateTime> datesToGetFromNetworkSortedDesc = allDatesToGet
        .where((date) => !datesOnLocal.contains(date))
        .toList()
      ..sort((a, b) => b.compareTo(a));
    final DateTime startDateToGetFromNetwork =
        datesToGetFromNetworkSortedDesc.last;
    final DateTime endDateToGetFromNetwork =
        datesToGetFromNetworkSortedDesc.first;
    late List<NasaApod> nasaApodsFromNetwork;
    try {
      nasaApodsFromNetwork =
          await nasaApodNetworkDatasource.getNasaApodsFromDateRange(
        startDateToGetFromNetwork,
        endDateToGetFromNetwork,
      );
    } on DioException catch (e) {
      return Left(NasaApiFailure(e));
    }
    for (NasaApod nasaApod in nasaApodsFromNetwork) {
      nasaApodLocalDatasource.saveNasaApodOnLocalDatabase(nasaApod);
    }
    List<NasaApod> totalApodsToReturn = ([
      ...apodsRetrievedSuccessfullyFromLocal
          .whereType<NasaApod>()
          .where((element) => !nasaApodsFromNetwork.contains(element)),
      ...nasaApodsFromNetwork
    ]..sort((a, b) => b.date.compareTo(a.date)));
    return Right(totalApodsToReturn);
  }
}
