import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kylipp/previous/firebase/auth.dart';
import 'package:kylipp/previous/models/user.dart';
import 'package:kylipp/previous/widgets/video_player_view.dart';
import 'package:video_player/video_player.dart';

import '../widgets/input.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  static const routeName = '/post-screen';
  final TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kBottomNavigationBarHeight;
    final Map<String, dynamic> map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Uint8List image = map['image'];
    final bool isVideo = map['isvideo'];
    void postImage() {
      User.postPicture(
          post: image,
          caption: _caption.text,
          isVideo: isVideo,
          date: DateTime.now(),
          uid: AuthMethods.uid);
      Navigator.of(context).pop();
    }

    return SafeArea(
      child: Scaffold(
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
                  child: isVideo
                      ? VideoPlayerVeiw(
                          url: (map['file'] as XFile).path,
                          dataSourceType: DataSourceType.file)
                      : Image(
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
