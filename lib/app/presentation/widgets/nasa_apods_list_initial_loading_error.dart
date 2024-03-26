import 'package:cloudwalk_nasa_challenge/shared/utils/test_keys.dart';
import 'package:flutter/material.dart';

class NasaApodsListInitialLoadingError extends StatelessWidget {
  final VoidCallback onTryAgainPressed;

  const NasaApodsListInitialLoadingError({
    super.key,
    required this.onTryAgainPressed,
  });

  @override
  Widget build(BuildContext context) {
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
            key: TestKeys.nasaApodsListInitialLoadingErrorTryAgainBtn,
            onPressed: onTryAgainPressed,
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
