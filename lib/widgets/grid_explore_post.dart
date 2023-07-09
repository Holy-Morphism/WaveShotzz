import 'package:flutter/material.dart';
import 'package:kylipp/models/explore_post.dart';
import 'package:kylipp/screens/explore_post_detail.dart';

import '../constants/constants.dart';

class GridExplorePost extends StatelessWidget {
  const GridExplorePost({
    super.key,
    required this.post,
  });
  final ExplorePost post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ExplorePostDetails.routeName, arguments: post),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: FadeInImage.assetNetwork(
          placeholder: loadingImage,
          image: post.post.photoUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
