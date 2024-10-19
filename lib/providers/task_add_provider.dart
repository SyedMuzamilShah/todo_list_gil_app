import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list_gil_app/helpers/snack_bar_show.dart';
import 'package:todo_list_gil_app/models/task_model.dart';


class TaskAddProvider with ImageProperties, LocationProperties, ChangeNotifier {
  // Update UI
  void _updateState() => notifyListeners();

  // Setters for state management with notifications
  void setLocationLoading(bool value) {
    _locationLoading = value;
    _updateState();
  }

  void setSavingData(bool value) {
    _savingData = value;
    _updateState();
  }

  void setImageAdded(bool value) {
    _isImageAdded = value;
    _updateState();
  }

  // Method to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await LoadImageClass().pickImage();
    if (image != null) {
      await setImageFile(image);
      _updateState();
    }
  }

  Future<void> saveTaskToFirebase({
    required BuildContext context,
    required String taskDescription,
  }) async {
    setSavingData(true);

    // Upload image to Firebase Storage if available
    if (_imageFile != null) {
      _firebaseImageUrl = await _uploadImageToFirebaseStorage();
    }
    // Create task model and save it to Firestore
    TaskModel taskData = TaskModel(
      taskName: "Task 1",
      description: taskDescription,
      imagePath: _firebaseImageUrl,
      location: _locationAddress,
      time: DateTime.now().toString(),
    );

    final takeInstanceForAddId = await FirebaseFirestore.instance
        .collection("tasks")
        .add(taskData.toJson());

    takeInstanceForAddId.update({"id": takeInstanceForAddId.id});

    if (context.mounted) {
      Dialogs.showSnakBar(
          context: context,
          message: "Task successfully added",
          color: Colors.green);
    }
    setSavingData(false);

    // Reset state after saving
    // And Update the UI
    _resetTaskData();
    _updateState();
  }

  // Helper method to upload the image to Firebase Storage
  Future<String> _uploadImageToFirebaseStorage() async {
    String path = 'files/images/$_imageName';
    // FirebaseStorge
    final storage = FirebaseStorage.instance.ref().child(path);

    // Create metadata with the correct MIME type
    final metadata = SettableMetadata(
        contentType: 'image/jpg'); // or 'image/png' based on your image format
    await storage.putData(_imagePreview!, metadata);
    String downloadUrl = await storage.getDownloadURL();
    return downloadUrl;
  }

  // Method to fetch the user's location (to be implemented)
  Future<void> fetchLocation() async {
    setLocationLoading(true);
    await Future.delayed(const Duration(seconds: 4));
    setLocationLoading(false);
    // Implementation for fetching location
  }

  void setLocationAddress(String address) {
    _locationAddress = address;
    _isLocationAdded = true;
    _updateState();
  }
}

class LoadImageClass {
  // Function to open the gallery
  Future<XFile?> pickImage() async {
    try {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      return null;
    }
  }
}

mixin LocationProperties {
  bool _isLocationAdded = false;
  bool _locationLoading = false;
  String? _locationAddress;

  bool get isLocationAdded => _isLocationAdded;
  bool get locationLoading => _locationLoading;
  String? get locationAddress => _locationAddress;

  void resetLocationData() {
    _isLocationAdded = false;
    _locationLoading = false;
    _locationAddress = null;
  }
}

mixin ImageProperties {
  // State variables
  bool _isImageAdded = false;
  bool _savingData = false;

  Uint8List? _imagePreview;
  File? _imageFile;
  String? _imageName;
  String? _firebaseImageUrl;

  // Getters
  bool get isImageAdded => _isImageAdded;
  bool get savingData => _savingData;
  Uint8List? get imagePreview => _imagePreview;
  File? get imageFile => _imageFile;

  // File set
  Future<void> setImageFile(XFile image) async {
    _imagePreview = await image.readAsBytes();
    _imageFile = File(image.path);
    _isImageAdded = true;
    _imageName = image.name;
  }

  // Helper method to reset task data
  void _resetTaskData() {
    _imageFile = null;
    _imagePreview = null;
    _imageName = null;
    _firebaseImageUrl = null;
    _isImageAdded = false;
  }
}