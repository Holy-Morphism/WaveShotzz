import 'package:flutter/material.dart';
import 'package:kylipp/core/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image, this.size = 50});
  final String? image;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: size,
        backgroundImage: const AssetImage(loadingImage),
        foregroundImage: image != null
            ? FadeInImage(
                    placeholder: const AssetImage(loadingImage),
                    image: NetworkImage(image!))
                .image
            : const AssetImage(loadingImage),
      ),
    );
  }
}
