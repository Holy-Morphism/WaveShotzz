import 'package:flutter/material.dart';
import 'package:kylipp/constants/constants.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/screens/home_screen.dart';
import 'package:kylipp/screens/signup_screen.dart';
import 'package:kylipp/utils/utils.dart';
import 'package:kylipp/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void setLoading(bool value) {
    setState(() {
      _isloading = value;
    });
  }

  void message(String res) {
    showSnackBar(context, res);
  }

  void newPage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  void login() async {
    setLoading(true);
    final String res =
        await AuthMethods.logIn(email: _email.text, password: _password.text);
    message(res);
    setLoading(false);
    if (res == 'Success') {
      newPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Image.asset(logo),
              TextFieldInput(
                textEditingController: _email,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your Email',
                label: 'Email',
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
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
                children: [
                  const Text(
                    'Don\'t have an account ?',
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignupScreen.routeName);
                      },
                      child: const Text(
                        'Sign Up',
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
