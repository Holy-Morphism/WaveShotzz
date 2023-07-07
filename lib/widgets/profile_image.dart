import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: image ?? const AssetImage(defaultImage),
    );
  }
}
