import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kylipp/widgets/bottom_navbar.dart';

import '../widgets/input.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  static const routeName = '/post-screen';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kBottomNavigationBarHeight;

    final Uint8List image =
        ModalRoute.of(context)!.settings.arguments as Uint8List;
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
                          textEditingController: _controller,
                          hintText: 'Enter a caption!',
                          label: 'Caption',
                          textInputType: TextInputType.text,
                        ),
                        TextButton(onPressed: () {}, child: const Text('Post'))
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
