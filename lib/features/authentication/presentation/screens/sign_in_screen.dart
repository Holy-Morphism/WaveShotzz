import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waveshotzz/config/router/routes.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:waveshotzz/legacy/screens/home_screen.dart';

import '../../../../core/constants/constants.dart';
import '../../../../utils/utils.dart';
import '../bloc/authentication_state.dart';
import '../widgets/user_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _bio.dispose();
    super.dispose();
  }

  void _message(String content) {
    showSnackBar(context, content);
  }

  void switchPage() =>
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

  void _signUp() =>
      BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationSignIn(
          username: _username.text,
          email: _email.text,
          password: _password.text,
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
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationFailed) {
              _message(state.error);
            }
            if (state is AuthenticationSuccess) {
              _message('Welcome');
              context.go(Routes.homeScreen);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                            radius: 64,
                            backgroundImage: _image != null
                                ? MemoryImage(_image!)
                                : const AssetImage(loadingImage)
                                    as ImageProvider),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: chooseImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    UserInput(
                      textEditingController: _username,
                      textInputType: TextInputType.text,
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
                      textInputType: TextInputType.text,
                      hintText: 'Enter your Password',
                      label: 'Password',
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
                    SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: _signUp,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  offset: const Offset(-4.0, -4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.redAccent.shade100,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: state is AuthenticationLoading
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  )
                                : Text('Sign Up',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                          ),
                        )),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            context.go(Routes.logInScreen);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
