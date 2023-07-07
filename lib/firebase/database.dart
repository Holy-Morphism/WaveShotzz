import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kylipp/firebase/auth.dart';
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

  static Future<User> currentUser() async {
    if (AuthMethods.auth.currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await db
          .collection('users')
          .doc(AuthMethods.auth.currentUser!.uid)
          .get();
      Map<String, dynamic> userData = snapshot.data()!;
      return User.fromJson(userData);
    } else {
      return const User(
          username: 'username',
          email: 'email',
          password: 'password',
          bio: 'bio',
          followers: [],
          following: [],
          profilePictureUrl: '',
          posts: []);
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
}
