import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:waveshotzz/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_event.dart';
import 'package:waveshotzz/features/user_profile/presentation/bloc/user_profile_bloc/user_profile_state.dart';
import 'package:waveshotzz/features/user_profile/presentation/screens/user_profile_screen.dart';

class MockUserProfileBloc extends MockBloc<UserProfileEvent, UserProfileState>
    implements UserProfileBloc {}

const UserProfileEntity user = UserProfileEntity(
  name: 'user',
  profilePictureUrl: 'profilePictureUrl',
  posts: [],
);

void main() {
  late MockUserProfileBloc mockUserProfileBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockUserProfileBloc = MockUserProfileBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return BlocProvider<UserProfileBloc>(
      create: (context) => mockUserProfileBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('user profile screen intial state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state).thenReturn(UserProfileInitial());

    //act
    await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen()));
    final textfield = find.byType(TextField);

    //assert
    expect(textfield, findsNothing);
  });

  testWidgets('user profile screen loading state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state).thenReturn(UserProfileLoading());

    //act
    await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen()));
    final loading = find.byType(CircularProgressIndicator);

    //assert
    expect(loading, findsOneWidget);
  });

  testWidgets('user profile screen loaded state', (widgetTester) async {
    //arrange
    when(() => mockUserProfileBloc.state).thenReturn(UserProfileLoaded(user));

    //act
    await mockNetworkImagesFor(() async => await widgetTester
        .pumpWidget(makeTestableWidget(const UserProfileScreen())));
    final loading = find.byType(Text);
    expect(loading, findsOneWidget);

    //assert
    expect(find.text(user.name), findsOneWidget);
  });
}
