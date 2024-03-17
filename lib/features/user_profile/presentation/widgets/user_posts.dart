import 'package:flutter/widgets.dart';

import '../../../../core/shared/user/domain/entities/post_entity.dart';

class UserPosts extends StatelessWidget {
  const UserPosts(
    this.posts, {
    super.key,
  });
  final List<PostEntity> posts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                posts[index].url,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
