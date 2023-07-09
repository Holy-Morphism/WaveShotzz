import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/models/explore_post.dart';
import 'package:kylipp/models/post.dart';

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

  static Future<User?> currentUser() async {
    if (AuthMethods.auth.currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await db
          .collection('users')
          .doc(AuthMethods.auth.currentUser!.uid)
          .get();
      Map<String, dynamic> userData = snapshot.data()!;
      return User.fromJson(userData);
    }
    return null;
  }

  static void addPost({required Post post}) {
    final user = AuthMethods.auth.currentUser;
    if (user != null) {
      db.collection('users').doc(user.uid).update({
        'posts': FieldValue.arrayUnion([post.toJson()])
      });
    }
  }

  static Future<List<ExplorePost>> getUsers() async {
    final String currentUserUid = AuthMethods.uid;
    List<ExplorePost> posts = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      if (document.id != currentUserUid) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(document.id)
                .get();
        Map<String, dynamic> userData = userSnapshot.data()!;
        List<dynamic> postList = userData['posts'];
        for (Map<String, dynamic> post in postList) {
          posts.add(
            ExplorePost(
              username: userData['username'],
              uid: document.id,
              post: Post.fromJson(post),
            ),
          );
        }
      }
    }

    return posts;
  }
}
