import 'dart:async';

import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/nasa_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apods_list_page_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetNasaApodsFromDateRangeUseCase>(),
  MockSpec<NasaApodsListPageStore>()
])
void main() {
  late NasaApodsListPageController nasaApodsListPageController;
  late MockNasaApodsListPageStore mockNasaApodsListPageStore;

  late MockGetNasaApodsFromDateRangeUseCase
      mockGetNasaApodsFromDateRangeUseCase;

  setUp(() {
    mockGetNasaApodsFromDateRangeUseCase =
        MockGetNasaApodsFromDateRangeUseCase();
    GetIt.instance.registerLazySingleton<GetNasaApodsFromDateRangeUseCase>(
        () => mockGetNasaApodsFromDateRangeUseCase);

    mockNasaApodsListPageStore = MockNasaApodsListPageStore();

    nasaApodsListPageController =
        NasaApodsListPageController(store: mockNasaApodsListPageStore);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  final exampleApodList = [
    NasaApod(
      date: DateTime.now().subtract(const Duration(days: 1)),
      explanation: 'explanation_1',
      hdurl: 'hdurl_1',
      mediaType: 'mediaType_1',
      title: 'title_1',
      url: 'url_1',
    ),
    NasaApod(
      date: DateTime.now(),
      explanation: 'explanation_2',
      hdurl: 'hdurl_2',
      mediaType: 'mediaType_2',
      title: 'title_2',
      url: 'url_2',
    ),
  ];

  group('initialize', () {
    test('should reset store, then set error false and loading true', () async {
      final completer = Completer();
      when(mockGetNasaApodsFromDateRangeUseCase(any)).thenAnswer((_) async {
        await completer.future;
        return const Right([]);
      });
      nasaApodsListPageController.initialize();
      verify(mockNasaApodsListPageStore.reset()).called(1);
      verify(mockNasaApodsListPageStore.setHasErrorLoadingNasaApodList(false))
          .called(1);
      verify(mockNasaApodsListPageStore.setIsLoadingNasaApodList(true))
          .called(1);
    });

    test('should call getNasaApodsFromDateRangeUseCase', () async {
      final completer = Completer();
      when(mockGetNasaApodsFromDateRangeUseCase(any)).thenAnswer((_) async {
        await completer.future;
        return const Right([]);
      });
      nasaApodsListPageController.initialize();
      verify(mockGetNasaApodsFromDateRangeUseCase(any)).called(1);
    });

    test('should set loading false and error true when use case fails',
        () async {
      when(mockGetNasaApodsFromDateRangeUseCase(any)).thenAnswer((_) async =>
          Left(NasaApiFailure(DioException(requestOptions: RequestOptions()))));

      await nasaApodsListPageController.initialize();

      verify(mockNasaApodsListPageStore.setIsLoadingNasaApodList(false))
          .called(1);
      verify(mockNasaApodsListPageStore.setHasErrorLoadingNasaApodList(true))
          .called(1);
    });

    test(
        'should set loading false and retrieved nasaApodList when use case succeeds',
        () async {
      when(mockGetNasaApodsFromDateRangeUseCase(any))
          .thenAnswer((_) async => Right(exampleApodList));

      await nasaApodsListPageController.initialize();

      verify(mockNasaApodsListPageStore.setIsLoadingNasaApodList(false))
          .called(1);
      verify(mockNasaApodsListPageStore.setNasaApodList(exampleApodList))
          .called(1);
    });
  });

  group('loadMoreNasaApods', () {
    test('should not call use case if isLoadingMoreNasaApods is true',
        () async {
      when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(true);

      await nasaApodsListPageController.loadMoreNasaApods();

      verifyNever(mockGetNasaApodsFromDateRangeUseCase(any));
    });

    test('should set isLoadingMoreNasaApods to true', () async {
      when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(false);
      final completer = Completer();
      when(mockGetNasaApodsFromDateRangeUseCase(any)).thenAnswer((_) async {
        await completer.future;
        return const Right([]);
      });

      nasaApodsListPageController.loadMoreNasaApods();

      verify(mockNasaApodsListPageStore.setIsLoadingMoreNasaApods(true))
          .called(1);
    });

    test('should call use case with correct date range', () async {
      when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(false);
      final completer = Completer();
      when(mockGetNasaApodsFromDateRangeUseCase(any)).thenAnswer((_) async {
        await completer.future;
        return const Right([]);
      });

      nasaApodsListPageController.loadMoreNasaApods();

      verify(mockGetNasaApodsFromDateRangeUseCase(DateRange(
        startDate: exampleApodList.reversed
            .toList()
            .last
            .date
            .subtract(const Duration(days: 22)),
        endDate: exampleApodList.reversed
            .toList()
            .last
            .date
            .subtract(const Duration(days: 1)),
      ))).called(1);
    });

    test('should set isLoadingMoreNasaApods to false', () async {
      when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(false);
      when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockNasaApodsListPageStore.nasaApodList)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockGetNasaApodsFromDateRangeUseCase(any))
          .thenAnswer((_) async => Right(exampleApodList));

      await nasaApodsListPageController.loadMoreNasaApods();

      verify(mockNasaApodsListPageStore.setIsLoadingMoreNasaApods(false))
          .called(1);
    });

    test('should add new apods to nasaApodList', () async {
      when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(false);
      when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockNasaApodsListPageStore.nasaApodList)
          .thenReturn(exampleApodList.reversed.toList());
      when(mockGetNasaApodsFromDateRangeUseCase(any))
          .thenAnswer((_) async => Right(exampleApodList));

      await nasaApodsListPageController.loadMoreNasaApods();

      verify(mockNasaApodsListPageStore.setNasaApodList(
          [...exampleApodList.reversed, ...exampleApodList])).called(1);
    });
  });
}
