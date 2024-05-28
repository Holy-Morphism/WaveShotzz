import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waveshotzz/features/user_profile/presentation/widgets/user_posts.dart';

import '../bloc/user_profile_bloc/user_profile_bloc.dart';
import '../bloc/user_profile_bloc/user_profile_state.dart';
import '../widgets/user_drawer.dart';

class UserProfileScreen extends StatelessWidget {
  final Function changeAppBar;
  const UserProfileScreen({super.key, required this.changeAppBar});

  @override
  Widget build(BuildContext context) {
    changeAppBar(
        AppBar(
          title: Text('Profile', style: Theme.of(context).textTheme.titleLarge),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        const UserDrawer());
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // appBar: AppBar(
        //   title: Text('Profile', style: Theme.of(context).textTheme.titleLarge),
        //   backgroundColor: Theme.of(context).colorScheme.secondary,
        // ),
        drawer: const UserDrawer(),
        body: SafeArea(
            child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listener: (context, state) {
            if (state is UserProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserProfileLoaded) {
              return Column(
                children: [
                  //User Information
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          //User Image
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(state.user.profilePictureUrl),
                            ),
                          ),
                          //User name,followers,following,posts
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.user.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      userData(state.user.posts.length, "Posts",
                                          context),
                                      userData(state.user.followers,
                                          'Followers', context),
                                      userData(state.user.following,
                                          'Following', context)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //User Posts
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: state.user.posts.isNotEmpty
                          ? UserPosts(state.user.posts)
                          : null,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        )));
  }
}

Widget userData(int count, String name, BuildContext context) {
  return Column(
    children: [
      Text(
        count.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      Text(
        name,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );
}
