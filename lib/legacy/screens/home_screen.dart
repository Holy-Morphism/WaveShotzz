import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kylipp/core/constants/constants.dart';
import 'package:kylipp/legacy/pages/connection.dart';
import 'package:kylipp/legacy/pages/explore.dart';
import 'package:kylipp/legacy/pages/home.dart';
import 'package:kylipp/legacy/pages/profile.dart';
import 'package:kylipp/legacy/screens/post_screen.dart';
import 'package:kylipp/legacy/widgets/bottom_navbar.dart';
import 'package:kylipp/legacy/widgets/drop_down_search.dart';

import '../utils/utils.dart';
import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void navigate({Uint8List? image, bool isVideo = false, XFile? file}) {
      Navigator.pop(context);
      if (image != null) {
        Navigator.of(context).pushNamed(PostScreen.routeName, arguments: {
          'image': image,
          'isvideo': isVideo,
          'file': file,
        });
      }
    }

    void setIndex(int i) {
      setState(() {
        index = i;
        //
        //
        //using this page controller you can make beautiful animation effects
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      });
    }

    void showImageSourceBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera Picture'),
                onTap: () async {
                  final image = await pickImage(ImageSource.camera);
                  navigate(image: image);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery Picture'),
                onTap: () async {
                  final image = await pickImage(ImageSource.gallery);
                  navigate(image: image);
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.video_call),
              //   title: const Text('Camera Video'),
              //   onTap: () async {
              //     final image = await pickVideo(ImageSource.camera);
              //     navigate(
              //         image: image['store'],
              //         isVideo: true,
              //         file: image['file']);
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.video_camera_back_outlined),
                title: const Text('Gallery Video'),
                onTap: () async {
                  final image = await pickVideo(ImageSource.gallery);
                  navigate(
                      image: image['store'],
                      isVideo: true,
                      file: image['file']);
                },
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showImageSourceBottomSheet(context);
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.add_box_outlined, color: Colors.white),
          ),
          bottomNavigationBar: BottomNavBar(index: index, setIndex: setIndex),
          appBar: 0 == index
              ? AppBar(
                  title: Image.asset(
                    logo,
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MessagesScreen.routeName);
                        },
                        icon: const Icon(Icons.message_outlined))
                  ],
                )
              : 1 == index
                  ? AppBar(
                      title: const DropDownSearchBar(),
                    )
                  : null,
          body: PageView(
            controller: _pageController,
            onPageChanged: (i) {
              setState(() => index = i);
            },
            children: [
              const HomePage(),
              const ExplorePage(),
              ConnectionPage(),
              const ProfilePage(),
            ],
          )),
    );
  }
}
