import 'package:flutter/material.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const String routeName = '/notifications-screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Center(
          child: Text('Notifications Screen'),
        ));
  }
}
