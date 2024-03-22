import 'package:cloudwalk_nasa_challenge/app/app.dart';
import 'package:cloudwalk_nasa_challenge/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  DI.setup();
  runApp(const App());
}
