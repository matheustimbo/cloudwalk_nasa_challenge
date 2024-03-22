import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/data/repositories/nasa_apod_repository_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/constants.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class DI {
  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  }) =>
      GetIt.instance.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
        type: type,
      );

  static setup() {
    final getIt = GetIt.instance;

    //external
    getIt.registerLazySingleton(
      () => Dio(
        BaseOptions(baseUrl: Constants.nasaApiBaseUrl, queryParameters: {
          'api_key': dotenv.env['NASA_API_KEY'],
        }),
      )..interceptors.add(CurlLoggerDioInterceptor()),
    );

    //datasources
    getIt.registerLazySingleton<NasaApodNetworkDatasource>(
        () => NasaApodNetworkDatasourceImpl(getIt.get()));

    //repositories
    getIt.registerLazySingleton<NasaApodRepository>(
        () => NasaApodRepositoryImpl(getIt.get()));

    // usecases
    getIt.registerLazySingleton(
        () => GetNasaApodsFromDateRangeUseCase(getIt.get()));
    // getIt
    //     .registerLazySingleton(() => GetTopRatedMoviesListUseCase(getIt.get()));
    // getIt.registerLazySingleton(
    //     () => GetNowPlayingMoviesListUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => SearchMovieByTitleUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => GetMovieCreditsUseCase(getIt.get()));

    //stores
    // getIt.registerLazySingleton(() => MovieSearchPageStore());
  }
}
