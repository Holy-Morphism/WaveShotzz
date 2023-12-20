import 'package:flutter/material.dart';
import 'package:waveshotzz/legacy/providers/user_provider.dart';
import 'package:waveshotzz/legacy/providers/users_provider.dart';
import 'package:waveshotzz/legacy/widgets/drop_down_search.dart';
import 'package:waveshotzz/legacy/widgets/profile_image.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  static const String routeName = '/messages-screen';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final usersProvider = Provider.of<UsersProvider>(context);
    userProvider.refreshUser();
    final User? user = userProvider.user;
    final List<User>? users = usersProvider.users;
    if (user != null && users != null) {
      List<String> uids = user.chats.keys.toList() as List<String>;
      return Scaffold(
        appBar: AppBar(
          title: const DropDownSearchBar(isMessage: true),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final User userFromUsers =
                users.firstWhere((element) => element.uid == uids[index]);
            return Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      ChatScreen.routeName,
                      arguments: userFromUsers),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ListTile(
                      leading: ProfileImage(image: userFromUsers.photoUrl),
                      title: Text(userFromUsers.username),
                    ),
                  ),
                ),
                const Divider()
              ],
            );
          },
          itemCount: uids.length,
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
