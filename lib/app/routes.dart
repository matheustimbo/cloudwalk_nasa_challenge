import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/not_found_page.dart';
import 'package:flutter/material.dart';

class RootRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NasaApodsListPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const NasaApodsListPage(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
