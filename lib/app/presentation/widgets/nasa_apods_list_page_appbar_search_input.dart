import 'package:flutter/material.dart';

class NasaApodsListPageAppbarSearchInput extends StatelessWidget {
  final TextEditingController searchTextController;
  final String typedSearchTerm;
  final Function(String) setTypedSearchTerm;

  const NasaApodsListPageAppbarSearchInput({
    super.key,
    required this.searchTextController,
    required this.typedSearchTerm,
    required this.setTypedSearchTerm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: searchTextController,
        style: const TextStyle(color: Colors.white),
        onChanged: setTypedSearchTerm,
        decoration: InputDecoration(
          hintText: 'Search by title or date',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          suffixIcon: (typedSearchTerm.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    searchTextController.clear();
                    setTypedSearchTerm('');
                  },
                )
              : null,
        ),
      ),
    );
  }
}
