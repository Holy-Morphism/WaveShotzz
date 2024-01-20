import 'package:flutter/material.dart';
import 'package:waveshotzz/features/authentication/presentation/widgets/page_switch_button.dart';

import 'log_in_screen.dart';
import 'sign_in_screen.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  int index = 0;
  static const List<String> question = [
    'Already have an account?',
    'Don\'t have an account?',
  ];
  static const List<String> buttonText = [
    'Login',
    'sign Up',
  ];
  void switchPage(int page) {
    setState(() {
      index = page;
      controller.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        child: PageSwitchButton(
            question: question[index],
            buttonText: buttonText[index],
            switchPage: switchPage,
            index: index == 0 ? 1 : 0),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: switchPage,
          children: const [
            SignInScreen(),
            LogInScreen(),
          ],
        ),
      ),
    );
  }
}
