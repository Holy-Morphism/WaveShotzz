import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import 'package:waveshotzz/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:waveshotzz/features/authentication/presentation/widgets/page_switch_button.dart';
import 'package:waveshotzz/legacy/screens/home_screen.dart';
import 'package:waveshotzz/features/authentication/presentation/widgets/user_input.dart';

import '../../../../config/router/routes.dart';
import '../../../../utils/utils.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_state.dart';

import '../widgets/authentication_button.dart';
=======
import 'package:kylipp/core/constants/constants.dart';
import 'package:kylipp/legacy/firebase/auth.dart';
import 'package:kylipp/legacy/screens/home_screen.dart';
import 'package:kylipp/legacy/utils/utils.dart';
import 'package:kylipp/features/authentication/presentation/widgets/user_input.dart';
>>>>>>> 4376f40 (login,signup routing added)

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _message(String res) {
    showSnackBar(context, res);
  }

  void newPage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  void login() => BlocProvider.of<AuthenticationBloc>(context)
      .add(AuthenticationLogIn(email: _email.text, password: _password.text));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
<<<<<<< HEAD
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
            if (state is AuthenticationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
=======
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(logo)),
              UserInput(
                textEditingController: _email,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your Email',
                label: 'Email',
              ),
              const SizedBox(
                height: 24,
              ),
              UserInput(
                textEditingController: _password,
                textInputType: TextInputType.text,
                hintText: 'Enter your Password',
                label: 'Password',
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: login,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    side: const BorderSide(width: 2, color: Colors.grey),
                  ),
                  child: _isloading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
>>>>>>> 4376f40 (login,signup routing added)
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
<<<<<<< HEAD
                  UserInput(
                    textEditingController: _email,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter your Email',
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  UserInput(
                    textEditingController: _password,
                    textInputType: TextInputType.text,
                    hintText: 'Enter your Password',
                    label: 'Password',
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AuthenticationButton(
                      title: 'Log In',
                      onPressed: login,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  const PageSwitchButton(
                      question: 'Don\'t have an account?',
                      buttonText: 'Sign Up',
                      switchPath: '/')
=======
                  TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text(
                        'Sign Up',
                      ))
>>>>>>> 4376f40 (login,signup routing added)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
