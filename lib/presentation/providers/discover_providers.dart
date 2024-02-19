import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/shared/data/local_video_posts.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';

class DiscoverProviders extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // comounicacion asincrona

    // await Future.delayed(const Duration(seconds: 2));

    // aqui ya deberian estar los videos
    // se cargan los videos de la lista de videos
    final List<VideoPost> newVideos = videoPosts
        .map(
          (video) => LocalVideoModel.fromJson(video).toVideoPostEntity(),
        )
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
