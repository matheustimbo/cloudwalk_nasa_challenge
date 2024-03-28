import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/pages/nasa_apods_list_page.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final exampleImageApod = NasaApod.fromJson({
  "date": "2024-03-26",
  "explanation":
      "Comet Pons-Brooks has quite a tail to tell.  First discovered in 1385, this erupting dirty snowball loops back into our inner Solar System every 71 years and, this time, is starting to put on a show for deep camera exposures.  In the featured picture, the light blue stream is the ion tail which consists of charged molecules pushed away from the comet's nucleus by the solar wind.  The ion tail, shaped by the Sun's wind and the comet's core's rotation, always points away from the Sun.  Comet 12P/Pons–Brooks is now visible with binoculars in the early evening sky toward the northwest, moving perceptibly from night to night.  The frequently flaring comet is expected to continue to brighten, on the average, and may even become visible with the unaided eye --  during the day -- to those in the path of totality of the coming solar eclipse on April 8.",
  "hdurl": "https://apod.nasa.gov/apod/image/2403/CometPons_Peirce_5119.jpg",
  "media_type": "image",
  "service_version": "v1",
  "title": "Comet Pons-Brooks' Ion Tail",
  "url": "https://apod.nasa.gov/apod/image/2403/CometPons_Peirce_1080.jpg"
});

final exampleVideoApod = NasaApod.fromJson({
  "date": "2024-03-25",
  "explanation":
      "What does a supernova remnant sound like? Although sound is a compression wave in matter and does not carry into empty space, interpretive sound can help listeners appreciate and understand a visual image of a supernova remnant in a new way. Recently, the Jellyfish Nebula (IC 443) has been sonified quite creatively.  In the featured sound-enhanced video, when an imaginary line passes over a star, the sound of a drop falling into water is played, a sound particularly relevant to the nebula's aquatic namesake.  Additionally, when the descending line crosses gas that glows red, a low tone is played, while green sounds a middle tone, and blue produces a tone with a relatively high pitch. Light from the supernova that created the Jellyfish Nebula left approximately 35,000 years ago, when humanity was in the stone age.  The nebula will slowly disperse over the next million years, although the explosion also created a dense neutron star which will remain indefinitely.",
  "media_type": "video",
  "service_version": "v1",
  "title": "Sonified: The Jellyfish Nebula Supernova Remnant",
  "url": "https://youtube.com/embed/NqBfQeJqkfU?rel=0"
});

class MockNasaApodsListPageController implements NasaApodsListPageController {
  @override
  final NasaApodsListPageStore store;

  MockNasaApodsListPageController({required this.store});

  @override
  Future<void> initialize() async {
    return;
  }

  @override
  Future<void> loadMoreNasaApods() async {
    return;
  }
}

@widgetbook.UseCase(
  name: 'Loading initial apods list',
  type: NasaApodsListPage,
)
Widget loadingInitialList(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(true);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}

@widgetbook.UseCase(
  name: 'Error loading initial apods list',
  type: NasaApodsListPage,
)
Widget errorLoadingInitialList(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(false);
    store.setHasErrorLoadingNasaApodList(true);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}

@widgetbook.UseCase(
  name: 'Initial list loaded',
  type: NasaApodsListPage,
)
Widget initialListLoaded(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(false);
    store.setHasErrorLoadingNasaApodList(false);
    store.setNasaApodList([
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
    ]);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}

@widgetbook.UseCase(
  name: 'Initial list loaded, loading more apods',
  type: NasaApodsListPage,
)
Widget initialListLoadedLoadingMoreApods(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(false);
    store.setHasErrorLoadingNasaApodList(false);
    store.setNasaApodList([
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
      exampleImageApod,
      exampleVideoApod,
    ]);
    store.setIsLoadingMoreNasaApods(true);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}

@widgetbook.UseCase(
  name: 'Searching with results',
  type: NasaApodsListPage,
)
Widget searchingWithResults(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(false);
    store.setHasErrorLoadingNasaApodList(false);
    store.setTypedSearchTerm(exampleImageApod.title);
    store.setNasaApodList([exampleImageApod, exampleVideoApod]);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}

@widgetbook.UseCase(
  name: 'Searching without results',
  type: NasaApodsListPage,
)
Widget searchingWithoutResults(BuildContext context) {
  Future<void> setupDI() async {
    await GetIt.instance.reset();
    final store = NasaApodsListPageStore();
    store.setIsLoadingNasaApodList(false);
    store.setHasErrorLoadingNasaApodList(false);
    store.setTypedSearchTerm('anything');
    store.setNasaApodList([exampleImageApod, exampleVideoApod]);
    GetIt.instance.registerFactory(() => store);
    GetIt.instance.registerFactoryParam((NasaApodsListPageStore store, _) =>
        MockNasaApodsListPageController(store: store)
            as NasaApodsListPageController);
  }

  return FutureBuilder(
    future: setupDI(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return const NasaApodsListPage();
      }
      return const SizedBox();
    },
  );
}
