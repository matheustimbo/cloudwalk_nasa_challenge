import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NasaApodDetailsPageArgs {
  final NasaApod nasaApod;

  NasaApodDetailsPageArgs({required this.nasaApod});
}

class NasaApodDetailsPage extends StatefulWidget {
  static const routeName = '/nasa_apod_details_page';

  final NasaApodDetailsPageArgs args;

  const NasaApodDetailsPage({
    super.key,
    required this.args,
  });

  @override
  State<NasaApodDetailsPage> createState() => _NasaApodDetailsPageState();
}

class _NasaApodDetailsPageState extends State<NasaApodDetailsPage> {
  late final nasaApod = widget.args.nasaApod;

  late final _youtubePlayerController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(nasaApod.url) ?? '',
    flags: const YoutubePlayerFlags(
      mute: false,
      hideControls: false,
    ),
  );

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: AppBar(
        title: Text(
          widget.args.nasaApod.title,
          style: const TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2B2B2B),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Builder(builder: (context) {
              if (nasaApod.mediaType == 'video') {
                return Hero(
                  tag: 'youtube_player_${nasaApod.url}',
                  child: YoutubePlayer(
                    aspectRatio: 1,
                    width: double.infinity,
                    controller: _youtubePlayerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                    ],
                  ),
                );
              }

              return Hero(
                tag: 'nasa_apod_image_${nasaApod.url}',
                child: CachedNetworkImage(
                  imageUrl: nasaApod.url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: const Color(0x52FFFFFF),
                    highlightColor: const Color(0x29FFFFFF),
                    child: Container(
                      color: const Color(0x7AFFFFFF),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  Text(
                    DateFormatters.dateTimeToNasaDateString(nasaApod.date),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    nasaApod.explanation,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 24 + MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
