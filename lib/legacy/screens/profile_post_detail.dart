import 'package:flutter/material.dart';
import 'package:kylipp/legacy/models/post.dart';
import 'package:kylipp/legacy/models/user_post.dart';
import '../widgets/post.dart' as p;

class ProfilePostDetails extends StatelessWidget {
  const ProfilePostDetails({super.key});
  static const routeName = '/post-details';

  @override
  Widget build(BuildContext context) {
    final map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Post post = map['post'];
    final Key keyf = map['key'];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: p.Post(
          userPost: UserPost(
            username: '',
            uid: '',
            post: post,
          ),
          isProfilePost: true,
          key: keyf,
        ),
      ),
    );
  }
}
