import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waveshotzz/config/router/routes.dart';

import '../../../../utils/utils.dart';
import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/authentication_button.dart';
import '../widgets/profile_image.dart';
import '../widgets/user_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _password,
      _username,
      _email,
      _bio,
      _confirmPassword;
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _password = TextEditingController();
    _username = TextEditingController();
    _email = TextEditingController();
    _bio = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _bio.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  void _message(String content) {
    showSnackBar(context, content);
  }

  void _signUp() =>
      BlocProvider.of<SignInBloc>(context).add(OnSubmittedSignInEvent(
          username: _username.text,
          email: _email.text,
          password: _password.text,
          confirmPassword: _confirmPassword.text,
          image: _image,
          bio: _bio.text));

  void chooseImage() async {
    final image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is ErrorSignInState) {
          _message(state.error);
        }
        if (state is SuccessSignInState) {
          _message('Welcome');
          context.go(Routes.userProfileScreen);
        }
      },
      builder: (context, state) {
        if (state is LoadingSignInState) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Container(
       
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Form(
              key: _formKey,
              onChanged: () {
                BlocProvider.of<SignInBloc>(context).add(OnChangeSignInEvent(
                    username: _username.text,
                    email: _email.text,
                    password: _password.text,
                    confirmPassword: _confirmPassword.text));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileImageSelector(
                    image: _image,
                    chooseImage: chooseImage,
                  ),
                  SizedBox(
                    height: 24,
                    child: state is InValidSignInState
                        ? Text(state.validationError,
                            style: const TextStyle(color: Colors.red))
                        : null,
                  ),
                  UserInput(
                    textEditingController: _username,
                    textInputType: TextInputType.name,
                    hintText: 'Enter your username',
                    label: 'Username',
                  ),
                  const SizedBox(height: 24),
                  UserInput(
                    textEditingController: _email,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter your Email',
                    label: 'Email',
                  ),
                  const SizedBox(height: 24),
                  UserInput(
                    textEditingController: _password,
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'Enter your Password',
                    label: 'Password',
                    isPass: true,
                  ),
                  const SizedBox(height: 24),
                  UserInput(
                    textEditingController: _confirmPassword,
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'Confirm your Password',
                    label: 'Confirm Password',
                    isPass: true,
                  ),
                  const SizedBox(height: 24),
                  UserInput(
                    textEditingController: _bio,
                    textInputType: TextInputType.text,
                    hintText: 'Enter your Bio',
                    label: 'Bio',
                  ),
                  const SizedBox(height: 24),
                  AuthenticationButton(
                      title: 'Sign Up',
                      onPressed: _signUp,
                      disabled: state is InValidSignInState),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
