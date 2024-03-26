import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apod_details_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/routes.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../test/app/presentation/pages/nasa_apods_list_page_test.mocks.dart';

void main() {
  late MockGetNasaApodsFromDateRangeUseCase
      mockGetNasaApodsFromDateRangeUseCase;

  Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: RootRouteGenerator.generateRoute,
      initialRoute: NasaApodsListPage.routeName,
    );
  }

  setUp(() {
    mockGetNasaApodsFromDateRangeUseCase =
        MockGetNasaApodsFromDateRangeUseCase();
    GetIt.instance.registerLazySingleton<GetNasaApodsFromDateRangeUseCase>(
        () => mockGetNasaApodsFromDateRangeUseCase);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  final dateRange = DateRange(
    startDate: DateTime.now().subtract(const Duration(days: 21)),
    endDate: DateTime.now(),
  );
  final exampleApodList = dateRange
      .getAllDatesBetween()
      .mapIndexed((index, date) => NasaApod(
            url: 'https://picsum.photos/id/${index + 1}/200/300',
            title: 'title_$index',
            mediaType: 'image',
            date: date,
            explanation: 'explanation_$index',
          ))
      .toList();

  testWidgets(
      'should navigate to details page when tapping on the first nasaapodlistitem',
      (widgetTester) async {
    when(mockGetNasaApodsFromDateRangeUseCase.call(dateRange))
        .thenAnswer((_) async => Right(exampleApodList));

    await widgetTester.pumpWidget(createWidgetUnderTest());

    await widgetTester.pump();

    await widgetTester.tap(find.text('title_21'));

    await widgetTester.pumpAndSettle();

    expect(find.byType(NasaApodDetailsPage), findsOneWidget);
    expect(find.byType(NasaApodsListPage), findsNothing);
    expect(
      find.text('explanation_21'),
      findsOneWidget,
    );
  });
}
