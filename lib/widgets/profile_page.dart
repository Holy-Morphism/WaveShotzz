import 'package:flutter/material.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/screens/login_screen.dart';
import 'package:kylipp/widgets/info.dart';
import 'package:kylipp/widgets/profile_image.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    currentUser.refreshUser();
    final user = currentUser.user;
    void _signOut() {
      AuthMethods.signOut();
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return LayoutBuilder(
        builder: (context, constriants) => SizedBox(
              height: constriants.maxHeight,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: constriants.maxHeight * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ProfileImage(
                                    image: user.profilePictureUrl != ''
                                        ? NetworkImage(user.profilePictureUrl)
                                        : null),
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
                                Expanded(
                                  child: TextButton(
                                      onPressed: _signOut,
                                      child: const Text('Sign Out')),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constriants.maxHeight * 0.6,
                      width: double.infinity,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ));
  }
}
