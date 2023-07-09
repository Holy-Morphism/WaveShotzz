import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/screens/profile_post_detail.dart';

class GridPost extends StatelessWidget {
  const GridPost({super.key, required this.userMap});
  final Map<String, dynamic> userMap;
  @override
  Widget build(BuildContext context) {
    final String image = userMap['photoUrl'];
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProfilePostDetails.routeName, arguments: userMap),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: FadeInImage.assetNetwork(
          placeholder: loadingImage,
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
