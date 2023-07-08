import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: const AssetImage(loadingImage),
      foregroundImage: FadeInImage(
              placeholder: const AssetImage(loadingImage),
              image: NetworkImage(image))
          .image,
    );
  }
}
