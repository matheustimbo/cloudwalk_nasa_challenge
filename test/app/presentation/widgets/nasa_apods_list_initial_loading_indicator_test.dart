import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NasaApodsListInitialLoadingIndicator(),
    );
  }

  testWidgets('should show a gridview with shimmers', (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(GridView), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(GridView),
        matching: find.byType(Shimmer),
      ),
      findsWidgets,
    );
  });
}
