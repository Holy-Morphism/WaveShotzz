import 'package:flutter/material.dart';

import '../../../user_profile/presentation/screens/user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentIndex = 0;

  AppBar? _appBar;
  Widget? _drawer;
  void changeAppBar(AppBar appBar, Widget drawer) {
    _appBar = appBar;
    _drawer = drawer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: currentIndex == 3
            ? _appBar
            : AppBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(Icons.add),
        ),
        drawer: currentIndex != 3 ? null : _drawer,
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Theme.of(context).colorScheme.onSecondary,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
              if (value != currentIndex) {
                setState(() {
                  currentIndex = value;
                });
              }
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
        body: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              //First Page
              Container(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    '1st Page',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),

              //Second Page
              Container(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    '2nd Page',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              //Third Page
              Container(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    '3rd Page',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              UserProfileScreen(changeAppBar: changeAppBar),
            ],
          ),
        ));
  }
}
