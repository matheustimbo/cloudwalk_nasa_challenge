import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
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
  List<NasaApod>? get nasaApodListSortedByDateDesc {
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

  @observable
  bool isLoadingMoreNasaApods = false;

  @action
  void setIsLoadingMoreNasaApods(bool b) => isLoadingMoreNasaApods = b;

  @observable
  String typedSearchTerm = '';

  @action
  void setTypedSearchTerm(String s) => typedSearchTerm = s;

  @computed
  List<NasaApod>? get searchTermResultApodList {
    if (nasaApodList == null) {
      return null;
    }
    if (typedSearchTerm.isEmpty) {
      return nasaApodList;
    }
    return nasaApodList!.where((element) {
      return element.title
              .toLowerCase()
              .contains(typedSearchTerm.toLowerCase()) ||
          DateFormatters.dateTimeToNasaDateString(element.date)
              .contains(typedSearchTerm);
    }).toList();
  }

  @action
  void reset() {
    nasaApodList = null;
    isLoadingNasaApodList = false;
    hasErrorLoadingNasaApodList = false;
  }
}
