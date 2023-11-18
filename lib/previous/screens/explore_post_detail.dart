import 'package:flutter/material.dart';
import 'package:kylipp/previous/models/user_post.dart';

import 'package:kylipp/previous/widgets/post.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});
  static const routeName = '/explore-post-details';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final UserPost post = map['post'];
    final Key keyf = map['key'];
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: Center(
        child: Post(
          userPost: post,
          key: keyf,
        ),
      ),
    );
  }
}
