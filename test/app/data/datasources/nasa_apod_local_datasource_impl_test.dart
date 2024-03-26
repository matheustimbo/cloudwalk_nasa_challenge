import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apod_local_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])
void main() {
  late MockBox<NasaApod> mockBox;
  late NasaApodLocalDatasourceImpl datasource;

  setUpAll(() {
    mockBox = MockBox<NasaApod>();
    datasource = NasaApodLocalDatasourceImpl(mockBox);
  });

  final exampleNasaApod = NasaApod(
    url: '',
    title: '',
    mediaType: '',
    date: DateTime.now(),
    explanation: '',
  );
  final exampleDate = exampleNasaApod.date;

  group('NasaApodLocalDatasourceImplTest', () {
    group('getNasaApodByDateFromLocal', () {
      test('should return a NasaApod from the local database', () {
        when(mockBox.get(DateFormatters.dateTimeToNasaDateString(exampleDate)))
            .thenReturn(exampleNasaApod);

        final result =
            datasource.getNasaApodByDateFromLocalDatabase(exampleDate);

        expect(result, exampleNasaApod);
        verify(
            mockBox.get(DateFormatters.dateTimeToNasaDateString(exampleDate)));
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when the local database fails', () {
        when(mockBox.get(DateFormatters.dateTimeToNasaDateString(exampleDate)))
            .thenThrow(Exception());

        expect(() => datasource.getNasaApodByDateFromLocalDatabase(exampleDate),
            throwsA(isA<Exception>()));

        verify(
            mockBox.get(DateFormatters.dateTimeToNasaDateString(exampleDate)));
        verifyNoMoreInteractions(mockBox);
      });
    });

    group('saveNasaApodOnLocalDatabase', () {
      test('should save NasaApod on local database', () {
        when(mockBox.put(DateFormatters.dateTimeToNasaDateString(exampleDate),
                exampleNasaApod))
            .thenAnswer((_) async => Future.value(null));

        final result = datasource.saveNasaApodOnLocalDatabase(exampleNasaApod);

        expect(result, isA<Future<void>>());
        verify(mockBox.put(DateFormatters.dateTimeToNasaDateString(exampleDate),
            exampleNasaApod));
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when the local database fails', () {
        when(mockBox.put(DateFormatters.dateTimeToNasaDateString(exampleDate),
                exampleNasaApod))
            .thenThrow(Exception());

        expect(() => datasource.saveNasaApodOnLocalDatabase(exampleNasaApod),
            throwsA(isA<Exception>()));

        verify(mockBox.put(DateFormatters.dateTimeToNasaDateString(exampleDate),
            exampleNasaApod));
        verifyNoMoreInteractions(mockBox);
      });
    });
  });
}
