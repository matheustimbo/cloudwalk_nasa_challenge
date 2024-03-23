import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/shared/utils/date_formatters.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NasaApodsListItem extends StatefulWidget {
  final NasaApod nasaApod;

  const NasaApodsListItem({
    super.key,
    required this.nasaApod,
  });

  @override
  State<NasaApodsListItem> createState() => _NasaApodsListItemState();
}

class _NasaApodsListItemState extends State<NasaApodsListItem> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    if (widget.nasaApod.mediaType == 'video') {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.nasaApod.url) ?? '',
        flags: const YoutubePlayerFlags(
          mute: true,
          hideControls: true,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Builder(builder: (context) {
              if (widget.nasaApod.mediaType == 'video') {
                return IgnorePointer(
                  ignoring: true,
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
                  ),
                );
              }

              return CachedNetworkImage(
                imageUrl: widget.nasaApod.url,
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
              );
            }),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.nasaApod.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormatters.dateTimeToNasaDateString(
                        widget.nasaApod.date),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
