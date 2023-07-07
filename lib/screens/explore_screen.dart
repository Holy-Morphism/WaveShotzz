import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  static const String routeName = '/explore-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text('Explore Page'),
      ),
    );
  }
}
