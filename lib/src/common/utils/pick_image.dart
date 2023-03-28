import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<List<File>> pickImages() async {
  final List<File> images = <File>[];
  final ImagePicker imagePicker = ImagePicker();
  final List<XFile> imageFiles = await imagePicker.pickMultiImage();

  if (imageFiles.isNotEmpty) {
    for (final XFile image in imageFiles) {
      images.add(File(image.path));
    }
  }

  return images;
}
