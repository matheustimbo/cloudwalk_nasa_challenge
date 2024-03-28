import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_local_datasource_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource.dart';
import 'package:cloudwalk_nasa_challenge/app/data/datasources/nasa_apod_network_datasource_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/data/repositories/nasa_apod_repository_impl.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/constants.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

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

  static Future<void> setup() async {
    final getIt = GetIt.instance;

    Hive.registerAdapter(NasaApodImplAdapter());
    final hiveBox = await Hive.openBox<NasaApod>('nasa_apods');
    //external
    getIt.registerLazySingleton(
      () => Dio(
        BaseOptions(baseUrl: Constants.nasaApiBaseUrl, queryParameters: {
          'api_key': dotenv.env['NASA_API_KEY'],
        }),
      )..interceptors.add(CurlLoggerDioInterceptor()),
    );
    getIt.registerLazySingleton<Box<NasaApod>>(() => hiveBox);

    //datasources
    getIt.registerLazySingleton<NasaApodNetworkDatasource>(
        () => NasaApodNetworkDatasourceImpl(getIt.get()));
    getIt.registerLazySingleton<NasaApodLocalDatasource>(
        () => NasaApodLocalDatasourceImpl(getIt.get()));

    //repositories
    getIt.registerLazySingleton<NasaApodRepository>(
        () => NasaApodRepositoryImpl(getIt.get(), getIt.get()));

    // usecases
    getIt.registerLazySingleton(
        () => GetNasaApodsFromDateRangeUseCase(getIt.get()));

    //stores
    getIt.registerFactory(() => NasaApodsListPageStore());

    //controllers
    getIt.registerFactoryParam((NasaApodsListPageStore store, _) =>
        NasaApodsListPageController(store: store));
  }
}
