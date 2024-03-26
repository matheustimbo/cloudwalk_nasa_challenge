import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:dio/dio.dart';

class NasaApiFailure extends Failure {
  final DioException dioException;

  NasaApiFailure(this.dioException);

  @override
  List<Object?> get props => [dioException];
}
