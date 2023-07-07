import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kylipp/screens/explore_screen.dart';
import 'package:kylipp/screens/home_screen.dart';
import 'package:kylipp/screens/notifications_page.dart';
import 'package:kylipp/screens/post_screen.dart';
import 'package:kylipp/screens/profile_screen.dart';

import '../utils/utils.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () => nav.pushReplacementNamed(HomeScreen.routeName),
            icon: const Icon(Icons.home)),
        IconButton(
            onPressed: () => nav.pushReplacementNamed(ExploreScreen.routeName),
            icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () => _showImageSourceBottomSheet(context),
            icon: const Icon(Icons.add_box_outlined)),
        IconButton(
            onPressed: () =>
                nav.pushReplacementNamed(NotificationsScreen.routeName),
            icon: const Icon(Icons.favorite_border)),
        IconButton(
            onPressed: () => nav.pushReplacementNamed(ProfileScreen.routeName),
            icon: const FaIcon(FontAwesomeIcons.globe)),
      ],
    ));
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(PostScreen.routeName,
                    arguments: await _open(ImageSource.camera));
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(PostScreen.routeName,
                    arguments: await _open(ImageSource.gallery));
              },
            ),
          ],
        );
      },
    );
  }

  Future<Uint8List> _open(ImageSource source) async {
    return await pickImage(source);
  }
}
