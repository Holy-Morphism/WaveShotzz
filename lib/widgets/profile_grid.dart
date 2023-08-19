import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/screens/profile_post_detail.dart';
import 'package:kylipp/widgets/video_player_view.dart';
import 'package:video_player/video_player.dart';

import '../models/post.dart';

class ProfileGrid extends StatelessWidget {
  const ProfileGrid({
    required super.key,
    required this.userMap,
    this.isProfile = false,
  });
  final Map<String, dynamic> userMap;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    final Post post = Post.fromJson(userMap);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProfilePostDetails.routeName,
          arguments: {'post': post, 'key': key}),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Hero(
          tag: key.toString(),
          child: post.isVideo
              ? VideoPlayerVeiw(
                  url: post.photoUrl,
                  dataSourceType: DataSourceType.network,
                  isMute: true,
                )
              : FadeInImage.assetNetwork(
                  placeholder: loadingImage,
                  image: post.photoUrl,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
