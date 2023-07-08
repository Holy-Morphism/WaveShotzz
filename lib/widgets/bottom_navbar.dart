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
    void navigate(Uint8List? image) {
      Navigator.pop(context);
      if (image != null) {
        Navigator.of(context).pushNamed(PostScreen.routeName, arguments: image);
      }
    }

    void showImageSourceBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () async {
                  final image = await pickImage(ImageSource.camera);
                  navigate(image);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  final image = await pickImage(ImageSource.gallery);
                  navigate(image);
                },
              ),
            ],
          );
        },
      );
    }

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
            onPressed: () => showImageSourceBottomSheet(context),
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
}
