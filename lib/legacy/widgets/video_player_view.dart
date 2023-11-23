import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerVeiw extends StatefulWidget {
  const VideoPlayerVeiw(
      {super.key,
      required this.url,
      required this.dataSourceType,
      this.isMute = false});
  final String url;
  final DataSourceType dataSourceType;
  final bool isMute;
  @override
  State<VideoPlayerVeiw> createState() => _VideoPlayerVeiwState();
}

class _VideoPlayerVeiwState extends State<VideoPlayerVeiw> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.url));
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.http(widget.url));
        break;
      default:
    }
    _chewieController = ChewieController(
      showControls: false,
      autoPlay: true,
      autoInitialize: true,
      videoPlayerController: _videoPlayerController,
      aspectRatio: 9 / 16,
    );
    if (widget.isMute) {
      _chewieController.setVolume(0);
    }
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Chewie(controller: _chewieController),
    );
  }
}
