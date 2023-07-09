import 'package:flutter/material.dart';
import 'package:kylipp/models/post.dart';
import 'package:date_format/date_format.dart';
import '../constants/constants.dart';

class ExplorePostDetails extends StatelessWidget {
  const ExplorePostDetails({super.key});
  static const routeName = '/explore-post-details';

  @override
  Widget build(BuildContext context) {
    final userMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final Post post = Post.fromJson(userMap);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_alt_outlined)),
            // IconButton(
            //     onPressed: () {}, icon: const FaIcon(Icons.comment_outlined)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down_alt_outlined)),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppBar(),
          Expanded(
            child: FadeInImage.assetNetwork(
              placeholder: loadingImage,
              image: post.photoUrl,
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
            leading: Text(post.caption),
            trailing: Text(formatDate(post.date, [dd, '/', mm, '/', yyyy])),
          )
        ],
      ),
    );
  }
}
