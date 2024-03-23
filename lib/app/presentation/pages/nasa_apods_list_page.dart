import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

class NasaApodsListPage extends StatefulWidget {
  static const routeName = '/nasa-apod-list';

  const NasaApodsListPage({super.key});

  @override
  State<NasaApodsListPage> createState() => _NasaApodsListPageState();
}

class _NasaApodsListPageState extends State<NasaApodsListPage> {
  final store = NasaApodsListPageStore();
  late final controller = NasaApodsListPageController(store: store);
  final scrollController = ScrollController();

  @override
  void initState() {
    controller.initialize();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 50) {
      controller.loadMoreNasaApods();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B2B2B),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: const Icon(Icons.search, color: Colors.white),
              hintText: 'Search by title or date',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.initialize,
        child: Observer(
          builder: (context) {
            if (store.isLoadingNasaApodList) {
              return GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  10,
                  (index) {
                    return Shimmer.fromColors(
                      baseColor: const Color(0x52FFFFFF),
                      highlightColor: const Color(0x29FFFFFF),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0x7AFFFFFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (store.hasErrorLoadingNasaApodList ||
                store.nasaApodList == null) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'An error occurred while loading the list of APODs',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: controller.initialize,
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return Observer(builder: (context) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) => NasaApodsListItem(
                          nasaApod: store.nasaApodListSortedByDateDesc![index]),
                      itemCount: store.nasaApodListSortedByDateDesc!.length,
                    ),
                  ),
                  if (store.isLoadingMoreNasaApods)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
