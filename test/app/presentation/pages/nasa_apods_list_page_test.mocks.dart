// Mocks generated by Mockito 5.4.4 from annotations
// in cloudwalk_nasa_challenge/test/app/presentation/pages/nasa_apods_list_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart' as _i4;
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart'
    as _i6;
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart'
    as _i3;
import 'package:mobx/mobx.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeReactiveContext_0 extends _i1.SmartFake
    implements _i2.ReactiveContext {
  _FakeReactiveContext_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNasaApodsListPageStore_1 extends _i1.SmartFake
    implements _i3.NasaApodsListPageStore {
  _FakeNasaApodsListPageStore_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NasaApodsListPageStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockNasaApodsListPageStore extends _i1.Mock
    implements _i3.NasaApodsListPageStore {
  @override
  set nasaApodList(List<_i4.NasaApod>? value) => super.noSuchMethod(
        Invocation.setter(
          #nasaApodList,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLoadingNasaApodList => (super.noSuchMethod(
        Invocation.getter(#isLoadingNasaApodList),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set isLoadingNasaApodList(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isLoadingNasaApodList,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasErrorLoadingNasaApodList => (super.noSuchMethod(
        Invocation.getter(#hasErrorLoadingNasaApodList),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set hasErrorLoadingNasaApodList(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #hasErrorLoadingNasaApodList,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLoadingMoreNasaApods => (super.noSuchMethod(
        Invocation.getter(#isLoadingMoreNasaApods),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set isLoadingMoreNasaApods(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isLoadingMoreNasaApods,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get typedSearchTerm => (super.noSuchMethod(
        Invocation.getter(#typedSearchTerm),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#typedSearchTerm),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#typedSearchTerm),
        ),
      ) as String);

  @override
  set typedSearchTerm(String? value) => super.noSuchMethod(
        Invocation.setter(
          #typedSearchTerm,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  void setNasaApodList(List<_i4.NasaApod>? l) => super.noSuchMethod(
        Invocation.method(
          #setNasaApodList,
          [l],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setIsLoadingNasaApodList(bool? b) => super.noSuchMethod(
        Invocation.method(
          #setIsLoadingNasaApodList,
          [b],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setHasErrorLoadingNasaApodList(bool? b) => super.noSuchMethod(
        Invocation.method(
          #setHasErrorLoadingNasaApodList,
          [b],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setIsLoadingMoreNasaApods(bool? b) => super.noSuchMethod(
        Invocation.method(
          #setIsLoadingMoreNasaApods,
          [b],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setTypedSearchTerm(String? s) => super.noSuchMethod(
        Invocation.method(
          #setTypedSearchTerm,
          [s],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reset() => super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [NasaApodsListPageController].
///
/// See the documentation for Mockito's code generation for more information.
class MockNasaApodsListPageController extends _i1.Mock
    implements _i6.NasaApodsListPageController {
  @override
  _i3.NasaApodsListPageStore get store => (super.noSuchMethod(
        Invocation.getter(#store),
        returnValue: _FakeNasaApodsListPageStore_1(
          this,
          Invocation.getter(#store),
        ),
        returnValueForMissingStub: _FakeNasaApodsListPageStore_1(
          this,
          Invocation.getter(#store),
        ),
      ) as _i3.NasaApodsListPageStore);

  @override
  _i7.Future<void> initialize() => (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> loadMoreNasaApods() => (super.noSuchMethod(
        Invocation.method(
          #loadMoreNasaApods,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
