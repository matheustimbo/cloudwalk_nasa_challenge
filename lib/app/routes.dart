import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apod_details_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/not_found_page.dart';
import 'package:flutter/material.dart';

class RootRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NasaApodDetailsPage.routeName:
        if (settings.arguments is NasaApodDetailsPageArgs) {
          final args = settings.arguments as NasaApodDetailsPageArgs;
          return MaterialPageRoute(
            builder: (_) => NasaApodDetailsPage(args: args),
          );
        }
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      case NasaApodsListPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const NasaApodsListPage(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
