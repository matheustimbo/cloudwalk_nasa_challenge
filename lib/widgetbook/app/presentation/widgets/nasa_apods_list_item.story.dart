import 'package:cloudwalk_nasa_challenge/app/data/models/nasa_apod.dart';
import 'package:cloudwalk_nasa_challenge/app/presentation/widgets/nasa_apods_list_item.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'NasaApod with Image',
  type: NasaApodsListItem,
)
Widget renderWithImage(BuildContext context) {
  final exampleApod = NasaApod.fromJson({
    "date": "2024-03-26",
    "explanation":
        "Comet Pons-Brooks has quite a tail to tell.  First discovered in 1385, this erupting dirty snowball loops back into our inner Solar System every 71 years and, this time, is starting to put on a show for deep camera exposures.  In the featured picture, the light blue stream is the ion tail which consists of charged molecules pushed away from the comet's nucleus by the solar wind.  The ion tail, shaped by the Sun's wind and the comet's core's rotation, always points away from the Sun.  Comet 12P/Pons–Brooks is now visible with binoculars in the early evening sky toward the northwest, moving perceptibly from night to night.  The frequently flaring comet is expected to continue to brighten, on the average, and may even become visible with the unaided eye --  during the day -- to those in the path of totality of the coming solar eclipse on April 8.",
    "hdurl": "https://apod.nasa.gov/apod/image/2403/CometPons_Peirce_5119.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "Comet Pons-Brooks' Ion Tail",
    "url": "https://apod.nasa.gov/apod/image/2403/CometPons_Peirce_1080.jpg"
  });
  return Center(
    child: SizedBox(
      width: 200,
      height: 200,
      child: NasaApodsListItem(
        nasaApod: exampleApod.copyWith(
          title: context.knobs.string(
            label: 'Title',
            initialValue: exampleApod.title,
          ),
          explanation: context.knobs.string(
            label: 'Explanation',
            initialValue: exampleApod.explanation,
          ),
          url: context.knobs.string(
            label: 'Url',
            initialValue: exampleApod.url,
          ),
          mediaType: context.knobs.string(
            label: 'Media Type (image|video)',
            initialValue: exampleApod.mediaType,
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'NasaApod with Video',
  type: NasaApodsListItem,
)
Widget renderWithVideo(BuildContext context) {
  final exampleApod = NasaApod.fromJson({
    "date": "2024-03-25",
    "explanation":
        "What does a supernova remnant sound like? Although sound is a compression wave in matter and does not carry into empty space, interpretive sound can help listeners appreciate and understand a visual image of a supernova remnant in a new way. Recently, the Jellyfish Nebula (IC 443) has been sonified quite creatively.  In the featured sound-enhanced video, when an imaginary line passes over a star, the sound of a drop falling into water is played, a sound particularly relevant to the nebula's aquatic namesake.  Additionally, when the descending line crosses gas that glows red, a low tone is played, while green sounds a middle tone, and blue produces a tone with a relatively high pitch. Light from the supernova that created the Jellyfish Nebula left approximately 35,000 years ago, when humanity was in the stone age.  The nebula will slowly disperse over the next million years, although the explosion also created a dense neutron star which will remain indefinitely.",
    "media_type": "video",
    "service_version": "v1",
    "title": "Sonified: The Jellyfish Nebula Supernova Remnant",
    "url": "https://youtube.com/embed/NqBfQeJqkfU?rel=0"
  });
  return Center(
    child: SizedBox(
      width: 200,
      height: 200,
      child: NasaApodsListItem(
        nasaApod: exampleApod.copyWith(
          title: context.knobs.string(
            label: 'Title',
            initialValue: exampleApod.title,
          ),
          explanation: context.knobs.string(
            label: 'Explanation',
            initialValue: exampleApod.explanation,
          ),
          url: context.knobs.string(
            label: 'Url',
            initialValue: exampleApod.url,
          ),
          mediaType: context.knobs.string(
            label: 'Media Type (image|video)',
            initialValue: exampleApod.mediaType,
          ),
        ),
      ),
    ),
  );
}
