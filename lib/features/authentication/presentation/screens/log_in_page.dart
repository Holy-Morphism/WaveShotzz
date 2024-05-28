import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waveshotzz/features/authentication/presentation/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:waveshotzz/features/authentication/presentation/widgets/user_input.dart';

import '../../../../config/router/routes.dart';
import '../../../../utils/utils.dart';

import '../widgets/authentication_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController _email, _password;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _message(String res) {
    showSnackBar(context, res);
  }

  void login() => BlocProvider.of<LogInBloc>(context)
      .add(SubmittedLogInEvent(email: _email.text, password: _password.text));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state is ErrorLogInState) {
          _message(state.error);
        }
        if (state is SuccessLogInState) {
          _message('Welcome');
          context.go(Routes.userProfileScreen);
        }
      },
      builder: (context, state) {
        if (state is LoadingLogInState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Form(
            key: _formKey,
            onChanged: () {
              BlocProvider.of<LogInBloc>(context).add(OnChangedLogInEvent(
                  email: _email.text, password: _password.text));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      child: state is InValidLogInState
                          ? Text(
                              state.validationError,
                              style: GoogleFonts.roboto(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            )
                          : null),
                ),
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
                    disabled: state is InValidLogInState,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
