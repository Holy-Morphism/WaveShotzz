import 'package:flutter/material.dart';
import 'package:waveshotzz/legacy/screens/other_profile_screen.dart';
import 'package:waveshotzz/legacy/widgets/profile_image.dart';

import '../models/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(OtherProfileScreen.routeName, arguments: user),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileImage(
              image: user.photoUrl,
              size: 25,
            ),
            Text(user.username),
          ],
        ),
      ),
    );
  }
}
