import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
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

  @override
  void initState() {
    controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.isLoadingNasaApodList) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.hasErrorLoadingNasaApodList) {
            return Column(
              children: [
                const Text('An error occurred while loading the list of APODs'),
                ElevatedButton(
                  onPressed: controller.initialize,
                  child: const Text('Try again'),
                ),
              ],
            );
          }
          if (store.nasaApodList == null) {
            return const SizedBox();
          }
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(store.nasaApodList![index].title),
              leading: CachedNetworkImage(
                imageUrl: store.nasaApodList![index].url,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemCount: store.nasaApodList!.length,
          );
        },
      ),
    );
  }
}
