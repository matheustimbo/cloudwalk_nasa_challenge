import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NasaApodsListInitialLoadingIndicator extends StatelessWidget {
  const NasaApodsListInitialLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
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
}
