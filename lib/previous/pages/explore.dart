import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_post.dart';
import '../providers/users_provider.dart';
import '../widgets/explore_grid.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    usersProvider.refreshUsers();
    final List<UserPost> posts = usersProvider.explorePosts;
    if (usersProvider.users == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
    } else if (posts.isEmpty) {
      return const Center(child: Text('No other Users'));
    } else {
      return Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, i) {
            return ExploreGrid(
              post: posts[i],
              key: ValueKey('${posts[i].uid}${posts[i].post.date.toString()}'),
            );
          },
          itemCount: posts.length,
        ),
      );
    }
  }
}
