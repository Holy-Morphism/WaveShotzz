import 'package:flutter/material.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
