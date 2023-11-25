import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';

void main() {
  final date = DateTime(2021);
  final comment = CommentModel(
    uid: '12345',
    name: 'user',
    comment: 'comment',
    date: date,
  );
  final post = PostModel(
    url: '//picture',
    caption: 'caption',
    date: date,
    likes: 0,
    comments: [],
  );

  late FakeFirebaseFirestore database;
  late MockFirebaseAuth mockFirebaseAuth;
  late String uid;

  setUp(() {
    database = FakeFirebaseFirestore();
    mockFirebaseAuth = MockFirebaseAuth();
    uid = mockFirebaseAuth.currentUser!.uid;
  });

  group('PostModel test', () {
    test('Should be subtype of PostEntity', () {
      //assert
      expect(post, isA<PostEntity>());
    });

    test('Should get data from firestore ', () async {
      //arrange
      await database.collection('users').doc(uid).set(post.toJson());
      await database
          .collection('users')
          .doc(uid)
          .collection('comments')
          .doc(date.toString())
          .set(comment.toJson());

      //act
      final snapshot = await database.collection('users').doc(uid).get();
      PostModel result = PostModel.fromJson(snapshot.data()!);
      result.comments = await database
          .collection('users')
          .doc(uid)
          .collection('comments')
          .get()
          .then((value) =>
              value.docs.map((e) => CommentModel.fromJson(e.data())).toList());

      //assert
      expect(result, equals(comment));
    });
  });
}
