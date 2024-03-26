import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/repositories/nasa_apod_repository.dart';
import 'package:cloudwalk_nasa_challenge/shared/failures/failure.dart';
import 'package:cloudwalk_nasa_challenge/shared/usecases/future_usecase.dart';
import 'package:dartz/dartz.dart';

class GetNasaApodsFromDateRangeUseCase
    implements FutureUseCase<List<NasaApod>, DateRange> {
  final NasaApodRepository nasaApodRepository;

  GetNasaApodsFromDateRangeUseCase(this.nasaApodRepository);

  @override
  Future<Either<Failure, List<NasaApod>>> call(DateRange param) {
    return nasaApodRepository.getNasaApodsFromDateRange(
      param.startDate,
      param.endDate,
    );
  }
}
