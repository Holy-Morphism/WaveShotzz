import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/models/user_post.dart';
import 'package:kylipp/models/post.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../models/user.dart';

class Database {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static void addUser({
    required String uid,
    required Map<String, dynamic> user,
  }) async {
    try {
      db.collection('users').doc(uid).set(user);
    } catch (e) {
      log(e.toString());
    }
  }

  static void addPost({required Post post}) {
    final user = AuthMethods.auth.currentUser;
    if (user != null) {
      db.collection('users').doc(user.uid).update({
        'posts': FieldValue.arrayUnion([post.toJson()])
      });
    }
  }

  static Future<User> getUser() async {
    final snapshot = await db.collection('users').doc(AuthMethods.uid).get();
    final data = snapshot.data()!;
    return User.fromJson(data);
  }

  static void addFollowing(String uid) {
    final user = AuthMethods.auth.currentUser;
    if (user != null) {
      db.collection('users').doc(user.uid).update({
        'following': FieldValue.arrayUnion([uid])
      });
      db.collection('users').doc(uid).update({
        'followers': FieldValue.arrayUnion([user.uid])
      });
    }
  }

  static void removeFollowing(String uid) async {
    final user = AuthMethods.auth.currentUser;
    if (user != null) {
      //Remove user from current users following
      final snapshot = await db.collection('users').doc(user.uid).get();
      final List<dynamic> following = snapshot['following'];
      following.remove(uid);
      await db
          .collection('users')
          .doc(user.uid)
          .update({'following': following});
      //Remove current user from user followers
      final snapshot1 = await db.collection('users').doc(uid).get();
      final List<dynamic> followers = snapshot1['followers'];
      followers.remove(user.uid);
      await db.collection('users').doc(uid).update({'following': followers});
    }
  }

  static Future<List<User>> getUsers() async {
    final String currentUserUid = AuthMethods.uid;
    final snapshot = await db.collection('users').get();
    return snapshot.docs
        .where((element) => element.id != currentUserUid)
        .map((doc) => User.fromJson(doc.data()))
        .toList();
  }

  static Future<List<User>> getUsersFilter(String filer) async {
    final String currentUserUid = AuthMethods.uid;
    final snapshot = await db.collection('users').get();
    return snapshot.docs
        .where((element) => element.id != currentUserUid)
        .map((doc) => User.fromJson(doc.data()))
        .where((element) =>
            element.username.toLowerCase().contains(filer.toLowerCase()))
        .toList();
  }

  static void likePhoto({
    required String uid,
    required DateTime dateTime,
  }) async {
    final snapshot = await db.collection('users').doc(uid).get();
    Map<String, dynamic> userData = snapshot.data()!;
    List<dynamic> postList = userData['posts'];
    final int index = postList.indexWhere((element) {
      log('device ${dateTime.toString()}');
      log('firebase ${element['date']}');
      return element['date'] == dateTime.toString();
    });
    log(index.toString());
    Map<String, dynamic> post = postList[index];
    List likes = post['likes'];
    if (!likes.contains(AuthMethods.uid)) {
      likes.add(AuthMethods.uid);
    }
    postList[index] = post;
    await db.collection('users').doc(uid).update({'posts': postList});
  }

  static void dislikePhoto({
    required String uid,
    required DateTime dateTime,
  }) async {
    final snapshot = await db.collection('users').doc(uid).get();
    Map<String, dynamic> userData = snapshot.data()!;
    List<dynamic> postList = userData['posts'];
    final index = postList
        .indexWhere((element) => element['date'] == dateTime.toString());
    Map<String, dynamic> post = postList[index];
    List likes = post['likes'];
    if (likes.contains(AuthMethods.uid)) {
      likes.remove(AuthMethods.uid);
    }
    postList[index] = post;
    await db.collection('users').doc(uid).update({'posts': postList});
  }

  static Future<List<UserPost>> getPostsOfFollowing() async {
    final user = AuthMethods.auth.currentUser;
    if (user != null) {
      final ds = await db.collection('users').doc(AuthMethods.uid).get();
      final data = ds.data()!;
      List<dynamic> following = data['following'];
      List<UserPost> posts = [];
      for (String f in following) {
        final snapshot = await db.collection('users').doc(f).get();
        Map<String, dynamic> userData = snapshot.data()!;
        List<dynamic> postList = userData['posts'];
        for (Map<String, dynamic> post in postList) {
          posts.add(
            UserPost(
              username: userData['username'],
              uid: f,
              post: Post.fromJson(post),
            ),
          );
        }
      }
      return posts;
    } else {
      return [];
    }
  }

  //Messaging

  static Future<String> createChat(String uid) async {
    final snapshot = await db.collection('users').doc(AuthMethods.uid).get();
    final data = snapshot.data()!;
    final User user = User.fromJson(data);
    if (user.chats.containsKey(uid)) {
      return user.chats[uid];
    }
    DocumentReference docRef =
        await db.collection('messages').add({'chat': []});
    db.collection('users').doc(AuthMethods.uid).set({
      'chats': {
        uid: docRef.id,
      },
    }, SetOptions(merge: true));
    db.collection('users').doc(uid).set({
      'chats': {
        AuthMethods.uid: docRef.id,
      },
    }, SetOptions(merge: true));
    db.collection('messages').doc(docRef.id).set({'chat': []});
    return docRef.id;
  }

  static Stream<List<types.Message>> getChat(String chatId) {
    return db.collection('messages').doc(chatId).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data()!.containsKey('chat')) {
        List<dynamic> messagesData = snapshot.data()!['chat'];
        final List<types.Message> m =
            messagesData.map((data) => types.Message.fromJson(data)).toList();
        m.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        return m;
      }
      return [];
    });
  }

  static void updateChat(String id, types.Message message) async {
    db.collection('messages').doc(id).update({
      'chat': FieldValue.arrayUnion([message.toJson()])
    });
  }
}
