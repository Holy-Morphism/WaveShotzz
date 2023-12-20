import 'package:flutter/material.dart';
import 'package:waveshotzz/legacy/models/user_post.dart';
import 'package:waveshotzz/legacy/providers/posts_of_following_provider.dart';
import 'package:waveshotzz/legacy/widgets/post.dart' as p;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostOfFollowingProvider>(context);
    postsProvider.refreshPosts();
    final List<UserPost>? posts = postsProvider.posts;
    if (posts == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
    } else if (posts.isEmpty) {
      return const Center(child: Text('You are not following Anyone'));
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return p.Post(key: ValueKey(posts[index]), userPost: posts[index]);
          },
          itemCount: posts.length,
        ),
      );
    }
  }
}
