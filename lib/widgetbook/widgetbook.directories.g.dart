// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/pages/nasa_apod_details_page.story.dart'
    as _i2;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/pages/nasa_apods_list_page.story.dart'
    as _i3;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/pages/not_found_page.story.dart'
    as _i4;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/widgets/nasa_apods_list_initial_loading_error.story.dart'
    as _i5;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/widgets/nasa_apods_list_initial_loading_indicator.story.dart'
    as _i6;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/widgets/nasa_apods_list_item.story.dart'
    as _i7;
import 'package:cloudwalk_nasa_challenge/widgetbook/app/presentation/widgets/nasa_apods_list_page_appbar_search_input.dart'
    as _i8;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'app',
    children: [
      _i1.WidgetbookFolder(
        name: 'presentation',
        children: [
          _i1.WidgetbookFolder(
            name: 'pages',
            children: [
              _i1.WidgetbookComponent(
                name: 'NasaApodDetailsPage',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'NasaApod with Image',
                    builder: _i2.withImage,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'NasaApod with Video',
                    builder: _i2.withVideo,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'NasaApodsListPage',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Error loading initial apods list',
                    builder: _i3.errorLoadingInitialList,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Initial list loaded',
                    builder: _i3.initialListLoaded,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Initial list loaded, loading more apods',
                    builder: _i3.initialListLoadedLoadingMoreApods,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Loading initial apods list',
                    builder: _i3.loadingInitialList,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Searching with results',
                    builder: _i3.searchingWithResults,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Searching without results',
                    builder: _i3.searchingWithoutResults,
                  ),
                ],
              ),
              _i1.WidgetbookLeafComponent(
                name: 'NotFoundPage',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i4.renderDefault,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'widgets',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'NasaApodsListInitialLoadingError',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i5.renderDefault,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'NasaApodsListInitialLoadingIndicator',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i6.renderDefault,
                ),
              ),
              _i1.WidgetbookComponent(
                name: 'NasaApodsListItem',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'NasaApod with Image',
                    builder: _i7.renderWithImage,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'NasaApod with Video',
                    builder: _i7.renderWithVideo,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'NasaApodsListPageAppbarSearchInput',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Default',
                    builder: _i8.renderDefault,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'With text not empty',
                    builder: _i8.renderWithTextNotEmpty,
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  )
];
