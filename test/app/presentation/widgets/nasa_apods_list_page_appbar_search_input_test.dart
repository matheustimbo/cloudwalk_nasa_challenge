import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_page_appbar_search_input.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/test_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetUnderTest(TextEditingController searchTextController,
      String typedSearchTerm, Function(String) setTypedSearchTerm) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Material(
        child: NasaApodsListPageAppbarSearchInput(
          searchTextController: searchTextController,
          typedSearchTerm: typedSearchTerm,
          setTypedSearchTerm: setTypedSearchTerm,
        ),
      ),
    );
  }

  testWidgets('should show a TextField with the correct hintText',
      (widgetTester) async {
    await widgetTester
        .pumpWidget(createWidgetUnderTest(TextEditingController(), '', (_) {}));

    expect(find.byType(TextField), findsOneWidget);
    final textField = find
        .byKey(TestKeys.nasaApodsListPageAppbarSearchInputTextField)
        .evaluate()
        .single
        .widget as TextField;
    expect(textField.decoration?.hintText, equals('Search by title or date'));
  });

  testWidgets('should show a TextField with the provided TextEditingController',
      (widgetTester) async {
    final searchTextController = TextEditingController();
    await widgetTester
        .pumpWidget(createWidgetUnderTest(searchTextController, '', (_) {}));

    expect(find.byType(TextField), findsOneWidget);
    final textField = find
        .byKey(TestKeys.nasaApodsListPageAppbarSearchInputTextField)
        .evaluate()
        .single
        .widget as TextField;
    expect(textField.controller, equals(searchTextController));
  });

  testWidgets(
      'should show a IconButton with the clear icon when typedSearchTerm is not empty and onPressed should clear the controller text and set TypedSearchTerm',
      (widgetTester) async {
    String value = 'not empty';
    final searchTextController = TextEditingController();
    await widgetTester.pumpWidget(
        createWidgetUnderTest(searchTextController, 'not empty', (s) {
      value = s;
    }));

    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byIcon(Icons.clear), findsOneWidget);

    await widgetTester.tap(find.byIcon(Icons.clear));

    expect(searchTextController.text, isEmpty);
    expect(value, equals(''));
  });

  testWidgets(
      'should not show a IconButton with the clear icon when typedSearchTerm is empty',
      (widgetTester) async {
    final searchTextController = TextEditingController();
    await widgetTester
        .pumpWidget(createWidgetUnderTest(searchTextController, '', (_) {}));

    expect(find.byType(IconButton), findsNothing);
    expect(find.byIcon(Icons.clear), findsNothing);
  });
}
