import 'dart:typed_data';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;
  ImageHelper({ImagePicker? imagePicker, ImageCropper? imageCropper})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  Future<List<XFile>> _pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (multiple) {
      return await _imagePicker.pickMultiImage(imageQuality: imageQuality);
    }
    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    return file == null ? [] : [file];
  }

  Future<CroppedFile?> _crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async {
    return await _imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: cropStyle,
        compressQuality: 100,
        uiSettings: [IOSUiSettings(), AndroidUiSettings()]);
  }

  Future<Uint8List?> pickProfileImage(
      {ImageSource imageSource = ImageSource.gallery}) async {
    final image = await _pickImage();
    final croppedFile =
        await _crop(file: image.first, cropStyle: CropStyle.circle);
    if (croppedFile != null) {
      return await croppedFile.readAsBytes();
    }
    return null;
  }
}
