import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  static const String picPath = '/profile-picture';
  static final FirebaseStorage storage = FirebaseStorage.instance;
  static Future<String> uploadProfilePic({
    required Uint8List profilePicture,
    required String uid,
  }) async {
    final Reference path = storage.ref('$uid$picPath');
    try {
      await path.putData(profilePicture);
    } catch (e) {
      log(e.toString());
    }
    final String url = await path.getDownloadURL();
    return url;
  }
}
