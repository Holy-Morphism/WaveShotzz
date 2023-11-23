import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:kylipp/legacy/models/user.dart';
import 'package:kylipp/legacy/screens/chat_screen.dart';

import '../firebase/database.dart';
import '../screens/other_profile_screen.dart';

class DropDownSearchBar extends StatelessWidget {
  const DropDownSearchBar({super.key, this.isMessage = false});
  final bool isMessage;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<User>(
      selectedItem: null,
      dropdownButtonProps: const DropdownButtonProps(icon: Icon(Icons.search)),
      asyncItems: (String filter) => Database.getUsersFilter(filter),
      filterFn: (item, filter) =>
          item.username.substring(0, filter.length) == filter,
      itemAsString: (User u) => u.username,
      onChanged: (User? data) {
        isMessage
            ? Navigator.of(context)
                .pushNamed(ChatScreen.routeName, arguments: data)
            : Navigator.of(context)
                .pushNamed(OtherProfileScreen.routeName, arguments: data);
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration:
            InputDecoration(labelText: isMessage ? 'Message' : 'Explore'),
      ),
    );
  }
}
