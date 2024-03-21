import 'package:flutter/material.dart';

class NasaImageList extends StatefulWidget {
  static const routeName = '/nasa-image-list';

  const NasaImageList({super.key});

  @override
  State<NasaImageList> createState() => _NasaImageListState();
}

class _NasaImageListState extends State<NasaImageList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('nasa image list page'), //TODO implement
    );
  }
}
