import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NasaApodsListPageStore store;

  setUp(() {
    store = NasaApodsListPageStore();
  });

  test('should have correct initial values', () {
    expect(store.nasaApodList, null);
    expect(store.isLoadingNasaApodList, false);
    expect(store.hasErrorLoadingNasaApodList, false);
    expect(store.isLoadingMoreNasaApods, false);
    expect(store.typedSearchTerm, '');
  });

  final exampleApodListSortedByDateAsc = [
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

  test('should set nasaApodList correctly', () {
    store.setNasaApodList(exampleApodListSortedByDateAsc);

    expect(store.nasaApodList, exampleApodListSortedByDateAsc);
  });

  test('should sort nasaApodList by date desc', () {
    store.setNasaApodList(exampleApodListSortedByDateAsc);

    expect(
      listEquals(exampleApodListSortedByDateAsc.reversed.toList(),
          store.nasaApodListSortedByDateDesc),
      equals(true),
    );
  });

  test('should set isLoadingNasaApodList correctly', () {
    store.setIsLoadingNasaApodList(true);

    expect(store.isLoadingNasaApodList, true);
  });

  test('should set hasErrorLoadingNasaApodList correctly', () {
    store.setHasErrorLoadingNasaApodList(true);

    expect(store.hasErrorLoadingNasaApodList, true);
  });

  test('should set isLoadingMoreNasaApods correctly', () {
    store.setIsLoadingMoreNasaApods(true);

    expect(store.isLoadingMoreNasaApods, true);
  });

  test('should set typedSearchTerm correctly', () {
    store.setTypedSearchTerm('search term');

    expect(store.typedSearchTerm, 'search term');
  });

  test(
      'searchTermResultApodList should be full nasaApodList when typedSearchTerm is empty',
      () {
    store.setNasaApodList(exampleApodListSortedByDateAsc);
    store.setTypedSearchTerm('');

    expect(store.searchTermResultApodList, exampleApodListSortedByDateAsc);
  });

  test(
      'searchTermResultApodList should be nasaApodList filtered by title when contains typedSearchTerm',
      () {
    store.setNasaApodList(exampleApodListSortedByDateAsc);
    store.setTypedSearchTerm(exampleApodListSortedByDateAsc.last.title);

    expect(
      listEquals(
        store.searchTermResultApodList,
        [exampleApodListSortedByDateAsc.last],
      ),
      equals(true),
    );
  });

  test(
      'searchTermResultApodList should be nasaApodList filtered by date an when contains typedSearchTerm',
      () {
    store.setNasaApodList(exampleApodListSortedByDateAsc);
    store.setTypedSearchTerm(DateFormatters.dateTimeToNasaDateString(
        exampleApodListSortedByDateAsc.last.date));

    expect(
      listEquals(store.searchTermResultApodList,
          [exampleApodListSortedByDateAsc.last]),
      equals(true),
    );
  });
}
