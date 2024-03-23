import 'package:cloudwalk_nasa_challenge/app/presentation/controllers/nasa_apods_list_page_controller.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/store/nasa_apods_list_page_store.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) => NasaApodsListItem(
                nasaApod: store.nasaApodListSortedByDate![index]),
            itemCount: store.nasaApodListSortedByDate!.length,
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
