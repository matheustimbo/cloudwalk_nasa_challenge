import 'package:cloudwalk_nasa_challenge/app/app.dart';
import 'package:cloudwalk_nasa_challenge/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await DI.setup();
  runApp(const App());
}
