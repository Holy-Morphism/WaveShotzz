import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waveshotzz/config/router/routes.dart';

import '../bloc/user_profile_bloc/user_profile_bloc.dart';
import '../bloc/user_profile_bloc/user_profile_event.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'User Profile Settings',
              style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Sign Out',
              style: GoogleFonts.nunitoSans(),
            ),
            onTap: () {
              Navigator.of(context).pop();
              BlocProvider.of<UserProfileBloc>(context).add(SignOutEvent());
              context.go(Routes.authPage);
            },
          ),
        ],
      ),
    );
  }
}
