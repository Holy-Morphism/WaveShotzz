import 'package:flutter/material.dart';
import 'package:kylipp/widgets/explore_page.dart';
import 'package:kylipp/widgets/home_page.dart';
import 'package:kylipp/widgets/navigationbar.dart';
import 'package:kylipp/widgets/notifications_page.dart';
import 'package:kylipp/widgets/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 4;
  static const List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    Center(child: Text('Camera')),
    NotificationsPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onDestinationSelected: changePage,
        index: currentPage,
      ),
      body: _pages[currentPage],
    );
  }
}
