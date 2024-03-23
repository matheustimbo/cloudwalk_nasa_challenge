import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:mobx/mobx.dart';

part 'nasa_apods_list_page_store.g.dart';

class NasaApodsListPageStore = _NasaApodsListPageStoreBase
    with _$NasaApodsListPageStore;

abstract class _NasaApodsListPageStoreBase with Store {
  @observable
  List<NasaApod>? nasaApodList;

  @action
  void setNasaApodList(List<NasaApod> l) => nasaApodList = l;

  @computed
  List<NasaApod>? get nasaApodListSortedByDate {
    if (nasaApodList == null) {
      return null;
    }
    var list = nasaApodList!;
    list.sort((a, b) => b.date.compareTo(a.date));
    return list;
  }

  @observable
  bool isLoadingNasaApodList = false;

  @action
  void setIsLoadingNasaApodList(bool b) => isLoadingNasaApodList = b;

  @observable
  bool hasErrorLoadingNasaApodList = false;

  @action
  void setHasErrorLoadingNasaApodList(bool b) =>
      hasErrorLoadingNasaApodList = b;
}
