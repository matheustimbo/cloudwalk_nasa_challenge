import 'package:cloudwalk_nasa_challenge/app/presentation/pages/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: NotFoundPage,
)
Widget renderDefault(BuildContext context) {
  return const NotFoundPage();
}
