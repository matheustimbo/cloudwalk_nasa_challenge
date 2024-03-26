import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: RootRouteGenerator.generateRoute,
      initialRoute: NasaApodsListPage.routeName,
    );
  }
}
