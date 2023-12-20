import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waveshotzz/legacy/firebase/database.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  UserProvider() {
    refreshUser();
  }

  void refreshUser() async {
    _user = await Database.getUser();
    notifyListeners();
  }

  User? get user => _user;
}
