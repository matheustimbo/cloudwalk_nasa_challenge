// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_apods_list_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NasaApodsListPageStore on _NasaApodsListPageStoreBase, Store {
  Computed<List<NasaApod>?>? _$nasaApodListSortedByDateComputed;

  @override
  List<NasaApod>? get nasaApodListSortedByDateDesc =>
      (_$nasaApodListSortedByDateComputed ??= Computed<List<NasaApod>?>(
              () => super.nasaApodListSortedByDateDesc,
              name: '_NasaApodsListPageStoreBase.nasaApodListSortedByDate'))
          .value;

  late final _$nasaApodListAtom =
      Atom(name: '_NasaApodsListPageStoreBase.nasaApodList', context: context);

  @override
  List<NasaApod>? get nasaApodList {
    _$nasaApodListAtom.reportRead();
    return super.nasaApodList;
  }

  @override
  set nasaApodList(List<NasaApod>? value) {
    _$nasaApodListAtom.reportWrite(value, super.nasaApodList, () {
      super.nasaApodList = value;
    });
  }

  late final _$isLoadingNasaApodListAtom = Atom(
      name: '_NasaApodsListPageStoreBase.isLoadingNasaApodList',
      context: context);

  @override
  bool get isLoadingNasaApodList {
    _$isLoadingNasaApodListAtom.reportRead();
    return super.isLoadingNasaApodList;
  }

  @override
  set isLoadingNasaApodList(bool value) {
    _$isLoadingNasaApodListAtom.reportWrite(value, super.isLoadingNasaApodList,
        () {
      super.isLoadingNasaApodList = value;
    });
  }

  late final _$hasErrorLoadingNasaApodListAtom = Atom(
      name: '_NasaApodsListPageStoreBase.hasErrorLoadingNasaApodList',
      context: context);

  @override
  bool get hasErrorLoadingNasaApodList {
    _$hasErrorLoadingNasaApodListAtom.reportRead();
    return super.hasErrorLoadingNasaApodList;
  }

  @override
  set hasErrorLoadingNasaApodList(bool value) {
    _$hasErrorLoadingNasaApodListAtom
        .reportWrite(value, super.hasErrorLoadingNasaApodList, () {
      super.hasErrorLoadingNasaApodList = value;
    });
  }

  late final _$_NasaApodsListPageStoreBaseActionController =
      ActionController(name: '_NasaApodsListPageStoreBase', context: context);

  @override
  void setNasaApodList(List<NasaApod> l) {
    final _$actionInfo = _$_NasaApodsListPageStoreBaseActionController
        .startAction(name: '_NasaApodsListPageStoreBase.setNasaApodList');
    try {
      return super.setNasaApodList(l);
    } finally {
      _$_NasaApodsListPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingNasaApodList(bool b) {
    final _$actionInfo =
        _$_NasaApodsListPageStoreBaseActionController.startAction(
            name: '_NasaApodsListPageStoreBase.setIsLoadingNasaApodList');
    try {
      return super.setIsLoadingNasaApodList(b);
    } finally {
      _$_NasaApodsListPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorLoadingNasaApodList(bool b) {
    final _$actionInfo =
        _$_NasaApodsListPageStoreBaseActionController.startAction(
            name: '_NasaApodsListPageStoreBase.setHasErrorLoadingNasaApodList');
    try {
      return super.setHasErrorLoadingNasaApodList(b);
    } finally {
      _$_NasaApodsListPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nasaApodList: ${nasaApodList},
isLoadingNasaApodList: ${isLoadingNasaApodList},
hasErrorLoadingNasaApodList: ${hasErrorLoadingNasaApodList},
nasaApodListSortedByDate: ${nasaApodListSortedByDateDesc}
    ''';
  }
}
