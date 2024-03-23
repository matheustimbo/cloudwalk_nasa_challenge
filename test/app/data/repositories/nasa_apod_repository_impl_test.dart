import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/data/repositories/nasa_apod_repository_impl.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apod_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaApodNetworkDatasource>()])
void main() {
  late MockNasaApodNetworkDatasource mockNasaApodNetworkDatasource;
  late NasaApodRepositoryImpl repository;

  setUpAll(() {
    mockNasaApodNetworkDatasource = MockNasaApodNetworkDatasource();
    repository = NasaApodRepositoryImpl(mockNasaApodNetworkDatasource);
  });

  final exampleApodList = [
    NasaApod(url: '', title: '', mediaType: '', date: DateTime.now()),
    NasaApod(url: '', title: '', mediaType: '', date: DateTime.now()),
  ];
  final startDate = DateTime.now().subtract(const Duration(days: 2));
  final endDate = DateTime.now();
  final exampleException = DioException(requestOptions: RequestOptions());

  group('GetNasaApodsFromDateRange', () {
    test('should get NasaApod List from Network Datasource', () async {
      when(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
              startDate, endDate))
          .thenAnswer((_) async => exampleApodList);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, equals(Right(exampleApodList)));
      verify(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
        startDate,
        endDate,
      ));
      verifyNoMoreInteractions(mockNasaApodNetworkDatasource);
    });

    test('should return a NasaApiFailure when an exception occurs', () async {
      when(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
              startDate, endDate))
          .thenThrow(exampleException);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, equals(Left(NasaApiFailure(exampleException))));
      verify(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
        startDate,
        endDate,
      ));
      verifyNoMoreInteractions(mockNasaApodNetworkDatasource);
    });
  });
}
