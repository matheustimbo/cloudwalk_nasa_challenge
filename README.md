# cloudwalk_nasa_challenge

CloudwalkNasaChallenge is an app built to show the pictures from NASA's "Astronomy Picture of the Day" using NASA's own [API](https://api.nasa.gov/)

## Features

- List NASA's APOD(Astronomy Picture of the Day) from NASA's API
- Search by APOD's title and date
- Offline-first approach
- Avoids refetching the same APOD already present in cache even if has internet connection since each day APOD's content will most likely never change

## Screenshots

<table>
    <tr>
        <td>Home Page</td>
        <td>Searching by title</td>
    </tr>
    <tr>
        <td><img src="https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/assets/screenshots/assets/screenshots/home.png?raw=true" width="100%"></td>
        <td><img src="https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/assets/screenshots/assets/screenshots/home_search.png?raw=true" width="100%"></td>
    </tr>
</table>
<table>
    <tr>
        <td>APOD details page with image</td>
        <td>APOD details page with youtube video</td>
    </tr>
    <tr>
        <td><img src="https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/assets/screenshots/assets/screenshots/details_apod_with_image.png?raw=true" width="100%"></td>
        <td><img src="https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/assets/screenshots/assets/screenshots/details_apod_with_video.png?raw=true" width="100%"></td>
    </tr>
</table>

## Github Actions Workflows

There are two github actions workflows. The first one, [pull_request.yml](https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/main/.github/workflows/pull_request.yml), is for building and testing pull requests(both unit and integration tests), and the second one, [push_main.yml](https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/main/.github/workflows/push_main.yml), is for building, testing and publishing on github release triggered by a push on main branch

## How to deploy the application

The application will be deployed automatically by the [push_main.yml](https://github.com/matheustimbo/cloudwalk_nasa_challenge/blob/main/.github/workflows/push_main.yml) workflow triggered by a push on the main branch

## Dependencies

- [dio](https://pub.dev/packages/dio) HTTP client
- [flutter_mobx](https://pub.dev/packages/flutter_mobx), [mobx](https://pub.dev/packages/mobx) and [mobx_codegen](https://pub.dev/packages/mobx_codegen) for generating MOBX stores (state management)
- [dartz](https://pub.dev/packages/dartz) Functional programming utilities, like Either
- [get_it](https://pub.dev/packages/get_it) Service locator for dependency injection
- [freezed](https://pub.dev/packages/freezed), [freezed_annotation](https://pub.dev/packages/freezed_annotation), [json_annotation](https://pub.dev/packages/json_annotation) For generating models
- [cached_network_image](https://pub.dev/packages/cached_network_image) Caching network images
- [mockito](https://pub.dev/packages/mockito) For generating mock classes used in tests
- [equatable](https://pub.dev/packages/equatable) Utility for comparing dart objects
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) Manages the .env file content access
- [intl](https://pub.dev/packages/intl) Internationalization utils (like date formatting)
- [curl_logger_dio_interceptor](https://pub.dev/packages/curl_logger_dio_interceptor) Utility that logs curl commands of http requests
- [shimmer](https://pub.dev/packages/shimmer) Widget for skeleton layout building
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter) Youtube player
- [hive](https://pub.dev/packages/hive), [hive_flutter](https://pub.dev/packages/hive_flutter) Local database

## How to execute the project

Check your flutter sdk integrity

    flutter doctor

clone the project and navigate to it's directory

    git clone https://github.com/matheustimbo/cloudwalk_nasa_challenge
    cd cloudwalk_nasa_challenge

Create a .env file at the root of the project following the .env.example structure. You can run the following command to create the file:

    echo NASA_API_KEY=YOUR_NASA_API_KEY > .env
    cat .env

then, download project dependencies and run in debug mode

    flutter pub get
    flutter run

## How to run unit tests and generate a html coverage report

Run the tests with

    flutter test --coverage

And then, generate and open the report with

    genhtml ./coverage/lcov.info -o coverage && open ./coverage/index.html

## How to run integration tests

With a Android emulator or iOS simulator open, run

    flutter test integration_test

## How to generate .g, .freezed and .mocks files

This project utilizes build_runner for generating files for models, mobx stores and mocks. To generate then, you can run

    dart run build_runner build --delete-conflicting-outputs

to generate once, or you can run

    dart run build_runner watch --delete-conflicting-outputs

to serve as a constant listener that will re-run if needed
