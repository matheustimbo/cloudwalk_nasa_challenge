import 'dart:async';

import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_error.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/test_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetUnderTest(VoidCallback onTryAgainPressed) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NasaApodsListInitialLoadingError(
        onTryAgainPressed: onTryAgainPressed,
      ),
    );
  }

  testWidgets('should show error ocurred message', (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest(() {}));

    expect(find.text('An error occurred while loading the list of APODs'),
        findsOneWidget);
  });

  testWidgets('should call onTryAgainPressed when user taps Try Again Button',
      (widgetTester) async {
    final completer = Completer();

    await widgetTester.pumpWidget(createWidgetUnderTest(completer.complete));

    await widgetTester
        .tap(find.byKey(TestKeys.nasaApodsListInitialLoadingErrorTryAgainBtn));

    expect(completer.isCompleted, isTrue);
  });
}
