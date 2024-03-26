import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/data/repositories/nasa_apod_repository_impl.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apod_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NasaApodNetworkDatasource>(),
  MockSpec<NasaApodLocalDatasource>()
])
void main() {
  late MockNasaApodNetworkDatasource mockNasaApodNetworkDatasource;
  late MockNasaApodLocalDatasource mockNasaApodLocalDatasource;
  late NasaApodRepositoryImpl repository;

  setUp(() {
    mockNasaApodNetworkDatasource = MockNasaApodNetworkDatasource();
    mockNasaApodLocalDatasource = MockNasaApodLocalDatasource();
    repository = NasaApodRepositoryImpl(
      mockNasaApodNetworkDatasource,
      mockNasaApodLocalDatasource,
    );
  });

  final endDate = DateTime.now();
  final startDate = endDate.subtract(const Duration(days: 1));
  final exampleApodList = [
    NasaApod(
      url: '',
      title: '',
      mediaType: '',
      date: endDate,
      explanation: '',
    ),
    NasaApod(
      url: '',
      title: '',
      mediaType: '',
      date: startDate,
      explanation: '',
    ),
  ];

  final exampleException = DioException(requestOptions: RequestOptions());

  group('GetNasaApodsFromDateRange', () {
    test(
        'should get NasaApod List entirely from Network Datasource if has no cached apods',
        () async {
      when(mockNasaApodLocalDatasource.getNasaApodByDateFromLocalDatabase(any))
          .thenAnswer((_) => null);

      when(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(any, any))
          .thenAnswer((_) async => exampleApodList);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, isA<Right>());
      expect(listEquals(result.getOrElse(() => []), exampleApodList), true);
      verify(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
        any,
        any,
      ));
      verify(mockNasaApodLocalDatasource.saveNasaApodOnLocalDatabase(
        exampleApodList.first,
      ));
      verify(mockNasaApodLocalDatasource.saveNasaApodOnLocalDatabase(
        exampleApodList.last,
      ));
      verifyNoMoreInteractions(mockNasaApodNetworkDatasource);
    });

    test(
        'should get NasaApodList only from Local Datasource if all apods are cached',
        () async {
      when(mockNasaApodLocalDatasource
              .getNasaApodByDateFromLocalDatabase(startDate))
          .thenAnswer((_) => exampleApodList.last);
      when(mockNasaApodLocalDatasource
              .getNasaApodByDateFromLocalDatabase(endDate))
          .thenAnswer((_) => exampleApodList.first);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, isA<Right>());
      expect(listEquals(result.getOrElse(() => []), exampleApodList), true);
      verify(mockNasaApodLocalDatasource.getNasaApodByDateFromLocalDatabase(
        any,
      ));
      verifyZeroInteractions(mockNasaApodNetworkDatasource);
      verifyNoMoreInteractions(mockNasaApodLocalDatasource);
    });

    test(
        'should get mixed NasaApodList from cache and network if only some apods are cached',
        () async {
      when(mockNasaApodLocalDatasource
              .getNasaApodByDateFromLocalDatabase(startDate))
          .thenAnswer((_) => exampleApodList.last);
      when(mockNasaApodLocalDatasource
              .getNasaApodByDateFromLocalDatabase(endDate))
          .thenAnswer((_) => null);
      when(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
              endDate, endDate))
          .thenAnswer((_) async => [exampleApodList.first]);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, isA<Right>());
      expect(listEquals(result.getOrElse(() => []), exampleApodList), true);
      verify(mockNasaApodLocalDatasource.getNasaApodByDateFromLocalDatabase(
        any,
      ));
      verify(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
        any,
        any,
      ));
      verify(mockNasaApodLocalDatasource.saveNasaApodOnLocalDatabase(
        exampleApodList.first,
      ));
      verifyNoMoreInteractions(mockNasaApodLocalDatasource);
      verifyNoMoreInteractions(mockNasaApodNetworkDatasource);
    });

    test('should return a NasaApiFailure when an exception occurs', () async {
      when(mockNasaApodLocalDatasource.getNasaApodByDateFromLocalDatabase(any))
          .thenAnswer((_) => null);
      when(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(any, any))
          .thenThrow(exampleException);

      final result = await repository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      );

      expect(result, equals(Left(NasaApiFailure(exampleException))));
      verify(mockNasaApodNetworkDatasource.getNasaApodsFromDateRange(
        any,
        any,
      ));
      verifyNoMoreInteractions(mockNasaApodNetworkDatasource);
    });
  });
}
