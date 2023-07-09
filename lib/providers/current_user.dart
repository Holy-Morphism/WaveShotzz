import 'package:flutter/foundation.dart';
import 'package:kylipp/firebase/database.dart';

import '../models/user.dart';

class CurrentUserProvider with ChangeNotifier {
  User? _user;
  void refreshUser() async {
    _user = await Database.currentUser();
    notifyListeners();
  }

  User? get user => _user;
}
