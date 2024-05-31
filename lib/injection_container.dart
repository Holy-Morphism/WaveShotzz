import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waveshotzz/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:waveshotzz/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/log_in_user.dart';
import 'package:waveshotzz/features/authentication/domain/usecases/sign_in_user.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/sign_out.dart';
import 'package:waveshotzz/features/user_profile/data/repositories/user_profile_repository_implementation.dart.dart';
import 'package:waveshotzz/features/user_profile/domain/usecases/delete_user.dart';

import 'features/user_profile/domain/repositories/user_profile_repository.dart';
import 'features/user_profile/domain/usecases/get_user.dart';
import 'features/user_profile/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'utils/image_helper.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //Firbase Authentication
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  //Firebase Firestore
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  //Firebase Storage
  locator.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  //Authentication Repository
  locator.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImplementation(locator(), locator(), locator()));

  //Authentication Usecases
  locator.registerSingleton<LogInUser>(LogInUser(locator()));

  locator.registerSingleton<SignInUser>(SignInUser(locator()));

  //Authentication bloc
  locator.registerSingleton<SignInBloc>(SignInBloc(locator()));

  locator.registerSingleton<LogInBloc>(LogInBloc(locator()));

  //User Profile Repository
  locator.registerSingleton<UserProfileRepository>(
      UserProfileRepositoryImplementation(locator(), locator(), locator()));

  //User Profile Usecases
  locator.registerSingleton<GetUser>(GetUser(locator()));

  locator.registerSingleton<DeleteUser>(DeleteUser(locator()));

  locator.registerSingleton<SignOut>(SignOut(locator()));

  //User Profile bloc
  locator.registerSingleton<UserProfileBloc>(UserProfileBloc(
    locator(),
    locator(),
    locator(),
  ));



  //Image Picker
  locator.registerLazySingleton<ImagePicker>(() => ImagePicker());

  //Image Cropper
  locator.registerLazySingleton<ImageCropper>(() => ImageCropper());

  //Image Helper
  locator.registerLazySingleton<ImageHelper>(() => ImageHelper());
}
