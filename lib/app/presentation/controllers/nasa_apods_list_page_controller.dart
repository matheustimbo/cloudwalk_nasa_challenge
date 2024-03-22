// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloudwalk_nasa_challenge/app/di.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/entities/date_range.dart';
import 'package:cloudwalk_nasa_challenge/app/domain/usecases/get_nasa_apods_from_date_range_usecase.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';

class NasaApodsListPageController {
  final NasaApodsListPageStore store;

  NasaApodsListPageController({
    required this.store,
  });

  final _getNasaApodsFromDateRangeUseCase =
      DI.get<GetNasaApodsFromDateRangeUseCase>();

  void initialize() async {
    store.setIsLoadingNasaApodList(true);
    final result = await _getNasaApodsFromDateRangeUseCase(
      DateRange(
        startDate: DateTime.now().subtract(const Duration(days: 7)),
        endDate: DateTime.now(),
      ),
    );
    store.setIsLoadingNasaApodList(false);
    result.fold(
      (l) => store.setHasErrorLoadingNasaApodList(true),
      (r) => store.setNasaApodList(r),
    );
  }
}
