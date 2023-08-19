import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kylipp/firebase/database.dart';
import 'package:kylipp/firebase/storage.dart';
import 'package:kylipp/models/user.dart' as model;

class AuthMethods {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String> logIn({
    required String email,
    required String password,
  }) async {
    String res = 'Success';
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user.';
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  static Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List? profilePicture,
  }) async {
    String res = 'Success';
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String url = '';
      if (profilePicture != null) {
        url = await Storage.uploadProfilePic(
            profilePicture: profilePicture, uid: credential.user!.uid);
      }
      log(url);
      model.User user = model.User(
          uid: credential.user!.uid,
          email: email,
          password: password,
          bio: bio,
          username: username,
          followers: [],
          following: [],
          photoUrl: url,
          posts: []);
      Database.addUser(uid: credential.user!.uid, user: user.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      }
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  static bool userLoggedIn() {
    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  static void signOut() async {
    await auth.signOut();
  }

  static String get uid {
    return auth.currentUser!.uid;
  }
}
