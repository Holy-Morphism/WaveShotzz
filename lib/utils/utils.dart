import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imageSource) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: imageSource);
  if (file != null) {
    return await file.readAsBytes();
  }
}

Future<Map<String, dynamic>> pickVideo(ImageSource imageSource) async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? file = await imagePicker.pickVideo(source: imageSource);
  if (file != null) {
    return {'store': await file.readAsBytes(), 'file': file};
  }
  return {};
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// Future<File> writeToFile(Uint8List bytes) async {
//   final directory = await getTemporaryDirectory();
//   final filePath = '${directory.path}/temp_video.mp4';

//   final file = File(filePath);
//   await file.writeAsBytes(bytes);

//   return file;
// }
