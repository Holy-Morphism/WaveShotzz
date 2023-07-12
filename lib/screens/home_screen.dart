import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/models/user.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/screens/chat_screen.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUserProvider>(context);
    currentUser.refreshUser();
    final User? user = currentUser.user;
    return SafeArea(
      child: user == null
          ? Scaffold(
              body: SizedBox.expand(
                child: Image.asset(
                  laptopLoading,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Scaffold(
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
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container();
                  },
                  itemCount: user.posts.length,
                ),
              )),
    );
  }
}
