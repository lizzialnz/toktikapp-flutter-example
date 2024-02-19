import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';
// reproductor de video scrollable

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // el page view es silimilar a un listado y permite hacer un scroll a pantalla completa
    return PageView.builder(
      // physics: const BouncingScrollPhysics(), // permite hacer un scroll con efecto de rebote en android
      scrollDirection: Axis.vertical,
      // cuantos elementos va a tener el page view
      itemCount: videos.length,
      // builder no recibe children sino itemBuilder para cargarlos de forma dinamica
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        // se agregara un stack que permitira agregar un wiget encima de otros, en este caso el gradiente encima del video y encima de este los botones

        return Stack(
          children: [
            // video player +gradientes
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            )),

            // botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
