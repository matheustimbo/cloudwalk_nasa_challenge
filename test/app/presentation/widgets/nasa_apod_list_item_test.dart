import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apod_details_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'nasa_apod_list_item_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NavigatorObserver>()])
void main() {
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Widget createWidgetUnderTest(NasaApod nasaApod) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Material(
        child: NasaApodsListItem(nasaApod: nasaApod),
      ),
    );
  }

  Widget createWidgetWithNavigationRoutesUnderTest(NasaApod nasaApod) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorObservers: [mockNavigatorObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NasaApodDetailsPage.routeName:
            return MaterialPageRoute(
              builder: (context) => Material(
                child: NasaApodDetailsPage(
                  args: NasaApodDetailsPageArgs(nasaApod: nasaApod),
                ),
              ),
            );
          case '/':
            return MaterialPageRoute(builder: (context) {
              return Material(child: NasaApodsListItem(nasaApod: nasaApod));
            });
        }
        return null;
      },
      initialRoute: '/',
    );
  }

  final exampleNasaApodWithVideo = NasaApod(
    title: 'title',
    url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    mediaType: 'video',
    date: DateTime.now(),
    explanation: '',
  );

  final exampleNasaApodWithImage = NasaApod(
    title: 'title',
    url: 'https://image.com/image.jpg',
    mediaType: 'image',
    date: DateTime.now(),
    explanation: '',
  );

  testWidgets('should show NasaApod title', (widgetTester) async {
    await widgetTester
        .pumpWidget(createWidgetUnderTest(exampleNasaApodWithImage));

    expect(find.text(exampleNasaApodWithImage.title), findsOneWidget);
  });

  testWidgets('should show formatted NasaApod date', (widgetTester) async {
    await widgetTester
        .pumpWidget(createWidgetUnderTest(exampleNasaApodWithImage));

    expect(
      find.text(DateFormatters.dateTimeToNasaDateString(
          exampleNasaApodWithImage.date)),
      findsOneWidget,
    );
  });

  testWidgets(
      'should show NasaApod image with provided url if mediatype is image',
      (widgetTester) async {
    await widgetTester
        .pumpWidget(createWidgetUnderTest(exampleNasaApodWithImage));

    expect(find.byType(CachedNetworkImage), findsOne);

    final cachedNetworkImage = find
        .byType(CachedNetworkImage)
        .evaluate()
        .single
        .widget as CachedNetworkImage;

    expect(cachedNetworkImage.imageUrl, exampleNasaApodWithImage.url);
  });

  testWidgets(
    'should show NasaApod video on YoutubePlayer with provided url if mediatype is video',
    (widgetTester) async {
      await widgetTester
          .pumpWidget(createWidgetUnderTest(exampleNasaApodWithVideo));
      await widgetTester.pump();

      expect(find.byType(YoutubePlayer), findsOne);

      final youtubePlayer =
          find.byType(YoutubePlayer).evaluate().single.widget as YoutubePlayer;

      expect(
        youtubePlayer.controller.initialVideoId,
        equals(YoutubePlayer.convertUrlToId(exampleNasaApodWithVideo.url)),
      );
    },
  );

  testWidgets('should navigate to NasaApodDetailsPage when tapped',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      createWidgetWithNavigationRoutesUnderTest(exampleNasaApodWithImage),
    );

    await widgetTester.tap(find.byType(InkWell));

    verify(mockNavigatorObserver.didPush(any, any));
  });
}
