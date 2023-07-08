import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  static const String routeName = '/explore-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, i) {
              return;
            }),
      ),
    );
  }
}
