import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});
  static const routeName = '/post-details';

  @override
  Widget build(BuildContext context) {
    final userMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String image = userMap['photoUrl'];
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Expanded(
            child: FadeInImage.assetNetwork(
              placeholder: loadingImage,
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
