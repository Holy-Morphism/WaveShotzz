import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/screens/login_screen.dart';
import 'package:kylipp/widgets/grid_post.dart';
import 'package:kylipp/widgets/info.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';
import 'package:kylipp/widgets/profile_image.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile-screen';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    currentUser.refreshUser();
    final user = currentUser.user;
    final double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;

    void signOut() {
      AuthMethods.signOut();
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: user == null
            ? SizedBox.expand(
                child: Image.asset(
                  gflLoading,
                  fit: BoxFit.cover,
                ),
              )
            : SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ProfileImage(image: user.profilePictureUrl),
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
                                        onPressed: signOut,
                                        child: const Text('Sign Out')),
                                  )
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, i) =>
                              GridPost(userMap: user.posts[i]),
                          itemCount: user.posts.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
