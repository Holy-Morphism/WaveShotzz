import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/shared/user/data/models/comment_model.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/comment_entity.dart';

void main() {
  final date = DateTime.now();
  final comment = CommentModel(
    uid: '12345',
    name: 'user',
    comment: 'comment',
    date: date,
  );
  late FakeFirebaseFirestore database;
  const String uid = '12345';

  setUp(() {
    database = FakeFirebaseFirestore();
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
