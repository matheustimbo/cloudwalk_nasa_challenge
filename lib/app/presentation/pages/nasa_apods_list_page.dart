import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_error.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_initial_loading_indicator.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_page_appbar_search_input.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/test_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final searchTextController = TextEditingController();

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
        title: Observer(builder: (context) {
          return NasaApodsListPageAppbarSearchInput(
            searchTextController: searchTextController,
            typedSearchTerm: store.typedSearchTerm,
            setTypedSearchTerm: store.setTypedSearchTerm,
          );
        }),
      ),
      body: RefreshIndicator(
        onRefresh: controller.initialize,
        child: Observer(
          builder: (context) {
            if (store.isLoadingNasaApodList) {
              return const NasaApodsListInitialLoadingIndicator();
            }
            if (store.hasErrorLoadingNasaApodList ||
                store.nasaApodList == null) {
              return NasaApodsListInitialLoadingError(
                onTryAgainPressed: controller.initialize,
              );
            }
            if (store.typedSearchTerm.isNotEmpty) {
              final searchResultList = store.searchTermResultApodList;
              if (searchResultList == null || searchResultList.isEmpty) {
                return const Center(
                  child: Text(
                    'No Apods found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    NasaApodsListItem(nasaApod: searchResultList[index]),
                itemCount: searchResultList.length,
              );
            }
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
                      nasaApod: store.nasaApodListSortedByDateDesc![index],
                    ),
                    itemCount: store.nasaApodListSortedByDateDesc!.length,
                  ),
                ),
                if (store.isLoadingMoreNasaApods)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: CircularProgressIndicator(
                          key: TestKeys
                              .nasaApodsListPageLoadingMoreNasaApodsIndicator,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
