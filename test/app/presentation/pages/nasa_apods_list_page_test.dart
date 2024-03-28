import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_error.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_indicator.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_page_appbar_search_input.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/test_keys.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apods_list_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NasaApodsListPageStore>(),
  MockSpec<NasaApodsListPageController>()
])
void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NasaApodsListPage(),
    );
  }

  late MockNasaApodsListPageStore mockNasaApodsListPageStore;
  late MockNasaApodsListPageController mockNasaApodsListPageController;

  setUp(() {
    mockNasaApodsListPageStore = MockNasaApodsListPageStore();
    mockNasaApodsListPageController = MockNasaApodsListPageController();

    GetIt.instance.registerFactory<NasaApodsListPageStore>(
        () => mockNasaApodsListPageStore);
    GetIt.instance.registerFactory<NasaApodsListPageController>(
        () => mockNasaApodsListPageController);
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
            url: 'url_$index',
            title: 'title_$index',
            mediaType: 'mediaType_$index',
            date: date,
            explanation: 'explanation_$index',
          ))
      .toList();

  testWidgets('should show NasaApodsListPageAppbarSearchInput',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.typedSearchTerm).thenReturn('');

    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(NasaApodsListPageAppbarSearchInput), findsOneWidget);
  });

  testWidgets(
      'should show NasaApodsListInitialLoadingIndicator when is fetching initial NasaApods list',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.isLoadingNasaApodList).thenReturn(true);

    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(NasaApodsListInitialLoadingIndicator), findsOneWidget);
  });

  testWidgets(
      'should show NasaApodsListInitialLoadingError when has an error while fetching initial NasaApods List',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.hasErrorLoadingNasaApodList)
        .thenReturn(true);

    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(NasaApodsListInitialLoadingError), findsOneWidget);
  });

  testWidgets(
      'should show GridView with NasaApodListItems when initial list fetch is successfull',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.isLoadingNasaApodList).thenReturn(false);
    when(mockNasaApodsListPageStore.hasErrorLoadingNasaApodList)
        .thenReturn(false);
    when(mockNasaApodsListPageStore.typedSearchTerm).thenReturn('');
    when(mockNasaApodsListPageStore.nasaApodList).thenReturn(exampleApodList);
    when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
        .thenReturn(exampleApodList);
    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(
      find.byType(SliverGrid),
      findsOneWidget,
    );
    expect(
      find.text(exampleApodList.first.title),
      findsOneWidget,
    );
    expect(
      (find.byType(SliverGrid).evaluate().single.widget as SliverGrid)
          .delegate
          .estimatedChildCount,
      equals(exampleApodList.length),
    );
  });

  testWidgets(
      'should show loadingMoreApodsIndicator when scrolling to the bottom of the list',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.isLoadingNasaApodList).thenReturn(false);
    when(mockNasaApodsListPageStore.hasErrorLoadingNasaApodList)
        .thenReturn(false);
    when(mockNasaApodsListPageStore.typedSearchTerm).thenReturn('');
    when(mockNasaApodsListPageStore.isLoadingMoreNasaApods).thenReturn(true);
    when(mockNasaApodsListPageStore.nasaApodList).thenReturn(exampleApodList);
    when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
        .thenReturn(exampleApodList);

    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(
      find.byType(SliverGrid),
      findsOneWidget,
    );

    await widgetTester.dragUntilVisible(
      find.text(exampleApodList.last.title),
      find.byType(CustomScrollView),
      const Offset(0, -100),
    );

    await widgetTester.dragUntilVisible(
      find.byKey(TestKeys.nasaApodsListPageLoadingMoreNasaApodsIndicator),
      find.byType(CustomScrollView),
      const Offset(0, -100),
    );

    expect(
      find.byKey(TestKeys.nasaApodsListPageLoadingMoreNasaApodsIndicator),
      findsOneWidget,
    );
  });

  testWidgets(
      'should filter nasaapods list by entered searchTerm querying by title and date',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.isLoadingNasaApodList).thenReturn(false);
    when(mockNasaApodsListPageStore.hasErrorLoadingNasaApodList)
        .thenReturn(false);
    when(mockNasaApodsListPageStore.typedSearchTerm).thenReturn('not empty');
    when(mockNasaApodsListPageStore.searchTermResultApodList)
        .thenReturn([exampleApodList.first]);
    when(mockNasaApodsListPageStore.nasaApodList).thenReturn(exampleApodList);
    when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
        .thenReturn(exampleApodList);

    await widgetTester.pumpWidget(createWidgetUnderTest());
    expect(
      (find.byType(NasaApodsListItem).evaluate().single.widget
              as NasaApodsListItem)
          .nasaApod,
      equals(exampleApodList.first),
    );
  });

  testWidgets(
      'should show "No Apods found" text if search term does not match any nasaapod',
      (widgetTester) async {
    when(mockNasaApodsListPageStore.isLoadingNasaApodList).thenReturn(false);
    when(mockNasaApodsListPageStore.hasErrorLoadingNasaApodList)
        .thenReturn(false);
    when(mockNasaApodsListPageStore.typedSearchTerm).thenReturn('not empty');
    when(mockNasaApodsListPageStore.searchTermResultApodList).thenReturn([]);
    when(mockNasaApodsListPageStore.nasaApodList).thenReturn(exampleApodList);
    when(mockNasaApodsListPageStore.nasaApodListSortedByDateDesc)
        .thenReturn(exampleApodList);
    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(
      find.text('No Apods found'),
      findsOneWidget,
    );
  });
}
