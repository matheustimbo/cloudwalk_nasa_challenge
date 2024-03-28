import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_error.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: NasaApodsListInitialLoadingError,
)
Widget renderDefault(BuildContext context) {
  return Center(
    child: NasaApodsListInitialLoadingError(
      onTryAgainPressed: () {},
    ),
  );
}
