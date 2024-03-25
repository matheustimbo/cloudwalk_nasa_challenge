import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_apod_network_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late NasaApodNetworkDatasourceImpl datasource;
  late MockDio mockDio;

  setUpAll(() {
    mockDio = MockDio();
    datasource = NasaApodNetworkDatasourceImpl(mockDio);
  });

  final exampleRawData = [
    {
      "copyright": "Panther Observatory",
      "date": "2006-04-15",
      "explanation":
          "In this stunning cosmic vista, galaxy M81 is on the left surrounded by blue spiral arms.  On the right marked by massive gas and dust clouds, is M82.  These two mammoth galaxies have been locked in gravitational combat for the past billion years.   The gravity from each galaxy dramatically affects the other during each hundred million-year pass.  Last go-round, M82's gravity likely raised density waves rippling around M81, resulting in the richness of M81's spiral arms.  But M81 left M82 with violent star forming regions and colliding gas clouds so energetic the galaxy glows in X-rays.  In a few billion years only one galaxy will remain.",
      "hdurl": "https://apod.nasa.gov/apod/image/0604/M81_M82_schedler_c80.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Galaxy Wars: M81 versus M82",
      "url": "https://apod.nasa.gov/apod/image/0604/M81_M82_schedler_c25.jpg"
    },
    {
      "date": "2013-07-22",
      "explanation":
          "You are here.  Everyone you've ever known is here. Every human who has ever lived -- is here. Pictured above is the Earth-Moon system as captured by the Cassini mission orbiting Saturn in the outer Solar System. Earth is the brighter and bluer of the two spots near the center, while the Moon is visible to its lower right. Images of Earth from Saturn were taken on Friday. Quickly released unprocessed images were released Saturday showing several streaks that are not stars but rather cosmic rays that struck the digital camera while it was taking the image.  The above processed image was released earlier today.  At nearly the same time, many humans on Earth were snapping their own pictures of Saturn.   Note: Today's APOD has been updated.",
      "hdurl":
          "https://apod.nasa.gov/apod/image/1307/earthmoon2_cassini_946.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Earth and Moon from Saturn",
      "url": "https://apod.nasa.gov/apod/image/1307/earthmoon2_cassini_960.jpg"
    },
  ];

  final exampleResult =
      exampleRawData.map((e) => NasaApod.fromJson(e)).toList();
  final exampleStartDate = DateTime.now().subtract(const Duration(days: 2));
  final exampleEndDate = DateTime.now();

  group('GetNasaApodsFromDateRange', () {
    test('should get a NasaApod List from the Nasa API', () async {
      when(mockDio.get('/planetary/apod', queryParameters: {
        'start_date': DateFormatters.dateTimeToNasaDateString(exampleStartDate),
        'end_date': DateFormatters.dateTimeToNasaDateString(exampleEndDate),
      })).thenAnswer((_) async => Response(
            data: exampleRawData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ));

      final result = await datasource.getNasaApodsFromDateRange(
        exampleStartDate,
        exampleEndDate,
      );

      expect(result, equals(exampleResult));
      verify(mockDio.get('/planetary/apod', queryParameters: {
        'start_date': DateFormatters.dateTimeToNasaDateString(exampleStartDate),
        'end_date': DateFormatters.dateTimeToNasaDateString(exampleEndDate),
      }));
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw a DioException when the network request fails',
        () async {
      when(mockDio.get('/planetary/apod', queryParameters: {
        'start_date': DateFormatters.dateTimeToNasaDateString(exampleStartDate),
        'end_date': DateFormatters.dateTimeToNasaDateString(exampleEndDate),
      })).thenThrow(DioException(requestOptions: RequestOptions()));

      final result = datasource.getNasaApodsFromDateRange(
        exampleStartDate,
        exampleEndDate,
      );

      expect(result, throwsA(isA<DioException>()));
      verify(mockDio.get('/planetary/apod', queryParameters: {
        'start_date': DateFormatters.dateTimeToNasaDateString(exampleStartDate),
        'end_date': DateFormatters.dateTimeToNasaDateString(exampleEndDate),
      }));
      verifyNoMoreInteractions(mockDio);
    });
  });
}
