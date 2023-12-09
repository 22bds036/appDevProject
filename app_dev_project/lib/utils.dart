import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: const Color.fromARGB(255, 251, 18, 1),
  ));
}


pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  // ignore: no_leading_underscores_for_local_identifiers
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No image selected");
}