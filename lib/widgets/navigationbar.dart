import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.onDestinationSelected, required this.index});
  final Function onDestinationSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: (i) => onDestinationSelected(i),
        selectedIndex: index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.search), label: ''),
          NavigationDestination(icon: Icon(Icons.add), label: ''),
          NavigationDestination(icon: Icon(Icons.favorite_border), label: ''),
          NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.globe), label: ''),
        ]);
  }
}
