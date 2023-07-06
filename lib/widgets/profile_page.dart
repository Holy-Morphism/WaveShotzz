import 'package:flutter/widgets.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<CurrentUser>(context);
    u.refreshUser();
    var user = u.user;
    return Center(
      child: Text(user.username),
    );
  }
}
