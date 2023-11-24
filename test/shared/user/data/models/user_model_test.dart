import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waveshotzz/features/authentication/data/models/user_model.dart';
import 'package:waveshotzz/features/authentication/domain/entities/user_entity.dart';

void main() {
  const user = UserModel(
      uid: '123456789',
      username: 'user',
      email: 'user@gmail.com',
      password: 'password123');
  late FakeFirebaseFirestore database;

  setUp(() async {
    database = FakeFirebaseFirestore();
  });

  group('UserModel test', () {
    test('Should be subtype of UserEntity', () {
      //assert
      expect(user, isA<UserEntity>());
    });

    test('Should get data from firestore ', () async {
      //arrange
      await database.collection('users').doc(user.uid).set(user.toJson());

      //act
      final snapshot = await database.collection('users').doc(user.uid).get();
      final result = UserModel.fromJson(snapshot.data()!);

      //assert
      expect(result, equals(user));
    });
  });
}
