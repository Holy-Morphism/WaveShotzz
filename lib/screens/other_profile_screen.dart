import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/info.dart';
import '../widgets/profile_grid.dart';
import '../widgets/profile_image.dart';

class OtherProfileScreen extends StatelessWidget {
  const OtherProfileScreen({super.key});
  static const String routeName = '/other-profile-screen';
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    final double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileImage(image: user.photoUrl),
                          Info(
                            title: user.posts.length.toString(),
                            subtitle: 'posts',
                          ),
                          Info(
                            title: user.followers.length.toString(),
                            subtitle: 'followers',
                          ),
                          Info(
                            title: user.following.length.toString(),
                            subtitle: 'following',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Info(
                            title: user.username,
                            subtitle: user.bio,
                            c: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.6,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, i) => ProfileGrid(
                    userMap: user.posts[i],
                    key: ValueKey(user.posts[i]),
                  ),
                  itemCount: user.posts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
