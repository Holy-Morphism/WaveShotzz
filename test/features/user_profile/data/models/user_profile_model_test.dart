import 'dart:typed_data';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waveshotzz/features/authentication/data/models/user_model.dart';
import 'package:waveshotzz/features/authentication/domain/entities/user_entity.dart';

void main() {
  const user = UserProfileModel(
    username: 'user',
    email: 'user@gmail.com',
    profilePicture: Uint8List.fromList([1, 2, 3, 4, 5]),
    posts: [],
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
      await database.collection('users').doc(uid).set(user.toJson());

      //act
      final snapshot = await database.collection('users').doc(uid).get();
      final result = UserModel.fromJson(snapshot.data()!);

      //assert
      expect(result, equals(user));
    });
  });
}
