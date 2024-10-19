import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list_gil_app/providers/task_add_provider.dart';

class Detailstaskprovider with ImageProperties, ChangeNotifier{
    // Update UI
  void _updateState() => notifyListeners();
  
    Future<void> pickImageFromGallery() async {
    final XFile? image = await LoadImageClass().pickImage();
    if (image != null) {
      await setImageFile(image);
      _updateState();
    }
  }
}