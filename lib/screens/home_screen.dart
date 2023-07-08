import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/screens/chat_screen.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
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
        body: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
