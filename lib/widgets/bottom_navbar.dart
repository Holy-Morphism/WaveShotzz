import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.index,
    required this.setIndex,
  });
  final int index;
  final void Function(int)? setIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.connectdevelop,
          ),
          label: 'Connections',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.earthAmericas,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: index,
      onTap: setIndex,
      selectedItemColor: Colors.redAccent,
      selectedIconTheme: const IconThemeData(color: Colors.redAccent),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
