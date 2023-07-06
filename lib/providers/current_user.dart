import 'package:flutter/foundation.dart';
import 'package:kylipp/firebase/database.dart';

import '../models/user.dart';

class CurrentUser with ChangeNotifier {
  User? _user;
  void refreshUser() async {
    _user = await Database.currentUser();
    notifyListeners();
  }

  User get user => _user == null
      ? const User(
          username: '',
          email: '',
          password: '',
          bio: '',
          followers: [],
          following: [],
          profilePictureUrl: '',
          posts: [])
      : _user!;
}
