import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/shared/user/data/models/post_model.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';

import 'package:waveshotzz/features/user_profile/data/models/user_profile_model.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

void main() {
  final date = DateTime.now();
  final post = PostModel(url: 'url', caption: 'caption', date: date, likes: 0);
  final user = UserProfileModel(
    name: 'user',
    profilePictureUrl: 'profilePictureUrl',
    posts: <PostEntity>[post],
  );
  late FakeFirebaseFirestore database;

  setUp(() async {
    database = FakeFirebaseFirestore();
  });

  const String uid = '123456';
  group('UserProfileModel test', () {
    test('Should be subtype of UserEntity', () {
      //assert
      expect(user, isA<UserProfileEntity>());
    });

    test('Should get data from firestore ', () async {
      //arrange
      await database.collection('users').doc(uid).set({
        'name': user.name,
        'profilePicture': user.profilePictureUrl,
      });
      await database
          .collection('users')
          .doc(uid)
          .collection('posts')
          .doc(post.date.toString())
          .set(post.toJson());

      //act
      final snapshot = await database.collection('users').doc(uid).get();
      final postSnapshot =
          await database.collection('users').doc(uid).collection('posts').get();
      final posts =
          postSnapshot.docs.map((e) => PostModel.fromJson(e.data())).toList();
      var data = snapshot.data()!;
      data.addAll({'posts': posts});
      final result = UserProfileModel.fromJson(data);

      //assert
      expect(result, equals(user));
    });
  });
}
