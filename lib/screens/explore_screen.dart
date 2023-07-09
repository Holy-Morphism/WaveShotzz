import 'package:flutter/material.dart';
import 'package:kylipp/models/explore_post.dart';
import 'package:kylipp/providers/explore_post_provider.dart';
import 'package:kylipp/widgets/grid_explore_post.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const String routeName = '/explore-screen';

  @override
  Widget build(BuildContext context) {
    final eposts = Provider.of<ExplorePostProvider>(context);
    eposts.refreshExplorPosts();
    final List<ExplorePost>? posts = eposts.explorePosts;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: posts == null
            ? SizedBox.expand(
                child: Image.asset(
                  gfLoading,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, i) {
                    return GridExplorePost(
                      post: posts[i],
                      key: ValueKey(
                          '${posts[i].uid}${posts[i].post.date.toString()}'),
                    );
                  },
                  itemCount: posts.length,
                ),
              ),
      ),
    );
  }
}
