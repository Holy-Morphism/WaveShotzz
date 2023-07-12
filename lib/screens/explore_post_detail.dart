import 'package:flutter/material.dart';
import 'package:kylipp/firebase/database.dart';
import 'package:kylipp/models/explore_post.dart';
import 'package:date_format/date_format.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';

class ExplorePostDetails extends StatefulWidget {
  const ExplorePostDetails({super.key});
  static const routeName = '/explore-post-details';

  @override
  State<ExplorePostDetails> createState() => _ExplorePostDetailsState();
}

class _ExplorePostDetailsState extends State<ExplorePostDetails> {
  int like = 0, dislike = 0;
  @override
  Widget build(BuildContext context) {
    final ExplorePost post =
        ModalRoute.of(context)!.settings.arguments as ExplorePost;
    final currentUser = Provider.of<CurrentUserProvider>(context);
    currentUser.refreshUser();
    final user = currentUser.user;
    if (user == null) {
      return Scaffold(
        body: SizedBox.expand(
          child: Image.asset(
            laptopLoading,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      bool value = user.following.contains(post.uid);
      return Scaffold(
        appBar: AppBar(
          title: Text(post.username),
          actions: [
            OutlinedButton(
              onPressed: () {
                value
                    ? currentUser.removeFollowing(post.uid)
                    : currentUser.addFollowing(post.uid);
                setState(() {
                  value = !value;
                });
              },
              child: value ? const Text('unfollow') : const Text('follow'),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      like = like + 1;
                    });
                    Database.likePhoto(uid: post.uid, dateTime: post.post.date);
                  },
                  icon: const Icon(Icons.thumb_up_alt_outlined)),
              Text((post.post.likes + like + post.post.dislikes + dislike)
                  .toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      dislike = dislike - 1;
                    });

                    Database.dislikePhoto(
                        uid: post.uid, dateTime: post.post.date);
                  },
                  icon: const Icon(Icons.thumb_down_alt_outlined)),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: FadeInImage.assetNetwork(
                placeholder: loadingImage,
                image: post.post.photoUrl,
                fit: BoxFit.contain,
              ),
            ),
            ListTile(
              leading: Text(post.post.caption),
              trailing:
                  Text(formatDate(post.post.date, [dd, '/', mm, '/', yyyy])),
            )
          ],
        ),
      );
    }
  }
}
