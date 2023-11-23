import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:kylipp/legacy/firebase/database.dart';
import 'package:kylipp/legacy/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../models/user.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String routeName = '/chat-screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late User otherUser;
  late UserProvider userProvider;
  late types.User user;
  String? id;

  @override
  void didChangeDependencies() {
    otherUser = ModalRoute.of(context)!.settings.arguments as User;
    userProvider = Provider.of<UserProvider>(context);
    userProvider.refreshUser();
    final User? currentUser = userProvider.user;
    if (currentUser != null) {
      user = currentUser.typeUser();
      if (currentUser.chats.containsKey(otherUser.uid)) {
        id = currentUser.chats[otherUser.uid];
      } else {
        getId(otherUser.uid);
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: id == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder<List<types.Message>>(
              initialData: const [],
              stream: Database.getChat(id!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  return snapshot.data == null
                      ? const CircularProgressIndicator()
                      : Chat(
                          messages: snapshot.data!,
                          onSendPressed: _handleSendPressed,
                          user: user);
                }
              },
            ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: user.id + DateTime.now().toString(),
      text: message.text,
    );
    Database.updateChat(id!, textMessage);
  }

  void getId(String uid) async {
    id = await Database.createChat(uid);
  }
}
