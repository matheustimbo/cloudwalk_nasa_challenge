import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_page_appbar_search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: NasaApodsListPageAppbarSearchInput,
)
Widget renderDefault(BuildContext context) {
  return Center(
    child: NasaApodsListPageAppbarSearchInput(
      searchTextController: TextEditingController(),
      typedSearchTerm: '',
      setTypedSearchTerm: (_) {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'With text not empty',
  type: NasaApodsListPageAppbarSearchInput,
)
Widget renderWithTextNotEmpty(BuildContext context) {
  return Center(
    child: NasaApodsListPageAppbarSearchInput(
      searchTextController: TextEditingController(),
      typedSearchTerm: 'not empty',
      setTypedSearchTerm: (_) {},
    ),
  );
}
