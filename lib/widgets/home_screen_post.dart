import 'package:flutter/material.dart';
import 'package:kylipp/models/explore_post.dart';

import '../constants/constants.dart';

class HomeScreenPost extends StatelessWidget {
  const HomeScreenPost({super.key, required this.post});
  final ExplorePost post;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          ListTile(
            leading: Text(post.username),
          ),
          FadeInImage.assetNetwork(
            placeholder: loadingImage,
            image: post.post.photoUrl,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
