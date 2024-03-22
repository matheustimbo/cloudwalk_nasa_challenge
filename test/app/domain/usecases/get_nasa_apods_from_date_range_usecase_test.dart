import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_nasa_apods_from_date_range_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaApodRepository>()])
void main() {
  late MockNasaApodRepository mockNasaApodRepository;
  late GetNasaApodsFromDateRangeUseCase getNasaApodsFromDateRangeUseCase;

  setUpAll(() {
    mockNasaApodRepository = MockNasaApodRepository();
    getNasaApodsFromDateRangeUseCase = GetNasaApodsFromDateRangeUseCase(
      mockNasaApodRepository,
    );
  });

  final exampleApodList = [
    NasaApod(url: '', title: '', media_type: '', date: DateTime.now()),
    NasaApod(url: '', title: '', media_type: '', date: DateTime.now()),
  ];
  final startDate = DateTime.now().subtract(const Duration(days: 2));
  final endDate = DateTime.now();
  final exampleException = DioException(requestOptions: RequestOptions());

  group('GetNasaApodsFromDateRangeUseCase', () {
    test('should call getNasaApodsFromDateRange from NasaApodRepository',
        () async {
      when(mockNasaApodRepository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      )).thenAnswer((_) async => Right(exampleApodList));

      final result = await getNasaApodsFromDateRangeUseCase(DateRange(
        startDate: startDate,
        endDate: endDate,
      ));

      expect(result, equals(Right(exampleApodList)));
      verify(mockNasaApodRepository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      ));
      verifyNoMoreInteractions(mockNasaApodRepository);
    });

    test('should return a NasaApiFailure when an exception occurs', () async {
      when(mockNasaApodRepository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      )).thenAnswer((_) async => Left(NasaApiFailure(exampleException)));

      final result = await getNasaApodsFromDateRangeUseCase(DateRange(
        startDate: startDate,
        endDate: endDate,
      ));

      expect(result, equals(Left(NasaApiFailure(exampleException))));
      verify(mockNasaApodRepository.getNasaApodsFromDateRange(
        startDate,
        endDate,
      ));
      verifyNoMoreInteractions(mockNasaApodRepository);
    });
  });
}
