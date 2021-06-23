import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum UploadType { FromFile, FromCamera }

Future<UploadType?> uploadPicker(BuildContext context) async {
  UploadType? type = await showDialog<UploadType>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text("Séléctioner une méthode"),
        children: [
          SimpleDialogOption(
            child: const Text("Upload une photo"),
            onPressed: () {
              Navigator.pop(
                context,
                UploadType.FromFile
              );
            },
          ),
          SimpleDialogOption(
            child: const Text("Prendre une photo"),
            onPressed: () {
              Navigator.pop(
                context,
                UploadType.FromCamera
              );
            },
          ),
        ],
      );
    },
  );

  return type;
}


class FileUploader {
  File? _image;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImageFile() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  File? get image => _image;
}
