import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FutureUseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params param);
}
