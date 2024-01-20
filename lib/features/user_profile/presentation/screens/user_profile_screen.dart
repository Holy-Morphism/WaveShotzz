import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_profile_bloc/user_profile_bloc.dart';
import '../bloc/user_profile_bloc/user_profile_state.dart';
import '../widgets/user_drawer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                      margin: const EdgeInsets.all(10),
                      color: Colors.black,
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
                                children: [
                                  Text(state.user.name),
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
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.user.posts[index].url,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            )
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
