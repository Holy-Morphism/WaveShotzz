import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waveshotzz/core/shared/user/data/models/post_model.dart';
import 'package:waveshotzz/core/shared/user/domain/entities/post_entity.dart';

void main() {
  final date = DateTime(2021);

  final post = PostModel(
    url: 'url',
    caption: 'caption',
    date: date,
    likes: 0,
  );

  late FakeFirebaseFirestore database;
  const String uid = '12345';

  setUp(() {
    database = FakeFirebaseFirestore();
  });

  group('PostModel test', () {
    test('Should be subtype of PostEntity', () {
      //assert
      expect(post, isA<PostEntity>());
    });

    test('Should get data from firestore ', () async {
      //arrange
      await database.collection('users').doc(uid).set(post.toJson());

      //act
      final snapshot = await database.collection('users').doc(uid).get();
      PostModel result = PostModel.fromJson(snapshot.data()!);

      //assert
      expect(result, equals(post));
    });
  });
}
