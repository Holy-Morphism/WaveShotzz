import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class ProfileImageSelector extends StatelessWidget {
  final Uint8List? image;
  final VoidCallback? chooseImage;

  const ProfileImageSelector({
    super.key,
    this.image,
    this.chooseImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: image != null
              ? MemoryImage(image!)
              : const AssetImage(loadingImage) as ImageProvider,
        ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: chooseImage,
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
