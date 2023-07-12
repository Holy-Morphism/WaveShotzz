import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kylipp/firebase/auth.dart';
import 'package:kylipp/providers/current_user.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

import '../widgets/input.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  static const routeName = '/post-screen';
  final TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUserProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kBottomNavigationBarHeight;
    final Uint8List image =
        ModalRoute.of(context)!.settings.arguments as Uint8List;
    void postImage() {
      user.postPicture(
          post: image,
          caption: _caption.text,
          date: DateTime.now(),
          uid: AuthMethods.uid);
      Navigator.of(context).pop();
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: height,
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Image(
                    image: MemoryImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldInput(
                          textEditingController: _caption,
                          hintText: 'Enter a caption!',
                          label: 'Caption',
                          textInputType: TextInputType.text,
                        ),
                        TextButton(
                            onPressed: postImage, child: const Text('Post'))
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
