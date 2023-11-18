import 'package:flutter/material.dart';
import 'package:kylipp/previous/models/user_post.dart';
import 'package:kylipp/previous/providers/user_provider.dart';
import 'package:kylipp/previous/widgets/video_player_view.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../core/constants/constants.dart';
import '../models/user.dart';

class Post extends StatefulWidget {
  const Post({
    required super.key,
    required this.userPost,
    this.isProfilePost = false,
  });
  final UserPost userPost;
  final bool isProfilePost;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late UserProvider userProvider;
  late User? user;
  late bool isFollowing;
  late bool isLiked;
  late UserPost userPost;
  @override
  void didChangeDependencies() {
    userPost = widget.userPost;
    final userProvider = Provider.of<UserProvider>(context);
    user = userProvider.user;
    if (user != null) {
      isFollowing = user!.isFollowing(widget.userPost.uid);
      isLiked = widget.userPost.isLiked(user!.uid);
    }
    super.didChangeDependencies();
  }

  void setLike() {
    if (isLiked) {
      widget.userPost.unLike(user!.uid);
    } else {
      widget.userPost.like(user!.uid);
    }
    setState(() {
      isLiked != isLiked;
    });
  }

  void setfollowing() {
    setState(() {
      isFollowing
          ? user!.removeFollowing(widget.userPost.uid)
          : user!.addFollowing(widget.userPost.uid);
      isFollowing = user!.isFollowing(widget.userPost.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width + 50;
    if (user == null) {
      return const CircularProgressIndicator(
        color: Colors.red,
      );
    } else if (!widget.isProfilePost) {
      return notProfilePost(
          height, width, isFollowing, setfollowing, isLiked, setLike);
    } else {
      return profilePost(height, width);
    }
  }

  Container notProfilePost(double height, double width, bool isFollowing,
      VoidCallback setfollowing, bool isLike, VoidCallback setLike) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: Column(children: [
          Flexible(
            flex: 1,
            child: ListTile(
              leading: Text(widget.userPost.username),
              trailing: TextButton(
                onPressed: setfollowing,
                child:
                    isFollowing ? const Text('unfollow') : const Text('follow'),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              width: width - 5,
              height: width - 5,
              decoration: const BoxDecoration(),
              clipBehavior: Clip.hardEdge,
              child: Hero(
                tag: widget.key.toString(),
                child: widget.userPost.post.isVideo
                    ? VideoPlayerVeiw(
                        url: widget.userPost.post.photoUrl,
                        dataSourceType: DataSourceType.network)
                    : FadeInImage.assetNetwork(
                        placeholder: loadingImage,
                        image: widget.userPost.post.photoUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListTile(
              title: Text(widget.userPost.post.likes.length.toString()),
              leading: IconButton(
                  onPressed: setLike,
                  icon: isLike
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : const Icon(Icons.favorite_border_outlined)),
            ),
          )
        ]),
      ),
    );
  }

  Container profilePost(double height, double width) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: Column(children: [
          Flexible(
            flex: 1,
            child: ListTile(
              leading: Text(widget.userPost.username),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              width: width - 5,
              height: width - 5,
              decoration: const BoxDecoration(),
              clipBehavior: Clip.hardEdge,
              child: Hero(
                tag: widget.key.toString(),
                child: widget.userPost.post.isVideo
                    ? VideoPlayerVeiw(
                        url: widget.userPost.post.photoUrl,
                        dataSourceType: DataSourceType.network)
                    : FadeInImage.assetNetwork(
                        placeholder: loadingImage,
                        image: widget.userPost.post.photoUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListTile(
              title: Text(widget.userPost.post.likes.length.toString()),
              leading: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
