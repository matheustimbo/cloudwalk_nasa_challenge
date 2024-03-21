import 'package:cloudwalk_nasa_challenge/shared/utils/constants.dart';
import 'package:dio/dio.dart';
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
        BaseOptions(baseUrl: Constants.nasaApiBaseUrl),
      ),
    );

    // //datasources
    // getIt.registerLazySingleton<MoviesDatasource>(
    //     () => MoviesDatasourceImpl(getIt.get()));

    // //repositories
    // getIt.registerLazySingleton<MoviesRepository>(
    //     () => MoviesRepositoryImpl(getIt.get()));

    // //usecases
    // getIt.registerLazySingleton(() => GetPopularMoviesListUseCase(getIt.get()));
    // getIt
    //     .registerLazySingleton(() => GetTopRatedMoviesListUseCase(getIt.get()));
    // getIt.registerLazySingleton(
    //     () => GetNowPlayingMoviesListUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => SearchMovieByTitleUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt.get()));
    // getIt.registerLazySingleton(() => GetMovieCreditsUseCase(getIt.get()));

    // //stores
    // getIt.registerLazySingleton(() => MovieSearchPageStore());
  }
}
