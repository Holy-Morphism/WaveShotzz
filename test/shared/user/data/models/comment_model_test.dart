import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/comment_entity.dart';

void main() {
  final date = DateTime(2021);
  final comment = CommentModel(
    name: 'user',
    comment: 'comment',
    date: date,
  );
  late FakeFirebaseFirestore database;
  late MockFirebaseAuth mockFirebaseAuth;
  late String uid;

  setUp(() {
    database = FakeFirebaseFirestore();
    mockFirebaseAuth = MockFirebaseAuth();
    uid = mockFirebaseAuth.currentUser!.uid;
  });

  group('CommentModel test', () {
    test('Should be subtype of CommentEntity', () {
      //assert
      expect(comment, isA<CommentEntity>());
    });

    test('Should get data from firestore ', () async {
      //arrange
      await database
          .collection('users')
          .doc(uid)
          .collection('comments')
          .doc(date.toString())
          .set(comment.toJson());

      //act
      final snapshot = await database
          .collection('users')
          .doc(uid)
          .collection('comments')
          .doc(date.toString())
          .get();
      final result = CommentModel.fromJson(snapshot.data()!);

      //assert
      expect(result, equals(comment));
    });
  });
}
