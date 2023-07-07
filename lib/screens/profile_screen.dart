import 'package:flutter/material.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/screens/login_screen.dart';
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
    final double constriants = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom;
    void signOut() {
      AuthMethods.signOut();
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SizedBox(
        height: constriants,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constriants * 0.4,
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
                                onPressed: signOut,
                                child: const Text('Sign Out')),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constriants * 0.6,
                width: double.infinity,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
