import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/screens/chat_screen.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';
import 'package:kylipp/widgets/home_screen_post.dart';
import 'package:provider/provider.dart';

import '../providers/home_post_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final hPosts = Provider.of<HomePostProvider>(context);
    hPosts.getFollowersPost();
    final posts = hPosts.posts;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const BottomNavBar(),
          appBar: AppBar(
            title: Image.asset(
              logo,
              fit: BoxFit.cover,
              height: 30,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ChatScreen.routeName);
                  },
                  icon: const Icon(Icons.message_outlined))
            ],
          ),
          body: posts == null
              ? SizedBox.expand(
                  child: Image.asset(
                    laptopLoading,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      log(posts[index].toString());
                      return HomeScreenPost(post: posts[index]);
                    },
                    itemCount: posts.length,
                  ),
                )),
    );
  }
}
