import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';

class MockUserProfileBloc
    extends MockBloc<MockUserProfileEvent, MockUserProfileState>
    implements MockUserProfileBloc {}

final user = UserProfileEntity(
    name: 'name',
    email: 'email',
    profilePicture: MemoryImage(Uint8List.fromList([1, 2, 3, 4, 5])),
    posts: []);

void main() {
  late MockUserProfileBloc mockUserProfileBloc;

  setUp(() {
    mockUserProfileBloc = MockUserProfileBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return BlocProvider<MockUserProfileBloc>(
      create: (context) => mockUserProfileBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('user profile screen intial state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state)
        .thenReturn(const MockUserProfileInitial());

    //act
    await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen()));
    final textfield = find.byType(TextField);

    //assert
    expect(textfield, findsNothing);
  });

  testWidgets('user profile screen loading state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state)
        .thenReturn(const MockUserProfileLoading());

    //act
    await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen()));
    final loading = find.byType(CircularProgressIndicator);

    //assert
    expect(loading, findsOneWidget);
  });

  testWidgets('user profile screen loading state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state)
        .thenReturn(MockUserProfileLoaded(user));

    //act
    await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen()));
    final loading = find.byType(Text);
    expect(loading, findsOneWidget);

    //assert
    expect(find.text(user.name), findsOneWidget);
  });
}
