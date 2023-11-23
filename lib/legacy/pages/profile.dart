import 'package:flutter/material.dart';
import 'package:kylipp/legacy/models/user.dart';
import 'package:kylipp/legacy/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../firebase/auth.dart';
import '../screens/login_screen.dart';
import '../widgets/profile_grid.dart';
import '../widgets/info.dart';
import '../widgets/profile_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.refreshUser();
    final User? user = userProvider.user;
    final double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;

    void signOut() {
      AuthMethods.signOut();
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return user == null
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.red,
          ))
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
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white)),
                                  child: TextButton(
                                    onPressed: signOut,
                                    child: const Text('Sign Out'),
                                  ),
                                ),
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
          );
  }
}
