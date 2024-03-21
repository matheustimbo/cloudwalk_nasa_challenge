import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_image_list.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/not_found_page.dart';
import 'package:flutter/material.dart';

class RootRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NasaImageList.routeName:
        return MaterialPageRoute(
          builder: (_) => const NasaImageList(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
