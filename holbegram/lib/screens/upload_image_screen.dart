import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    super.key,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  // This will hold the image file data once the user picks one
  Uint8List? _image;

  /// Opens the device gallery for the user to pick an image.
  void selectImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Read the image file as bytes and update the state to show it
      final fileBytes = await pickedFile.readAsBytes();
      setState(() {
        _image = fileBytes;
      });
    }
  }

  /// Opens the device camera for the user to take a picture.
  void selectImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final fileBytes = await pickedFile.readAsBytes();
      setState(() {
        _image = fileBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello, ${widget.username} Welcome to Holbegram.'),
              const Text(
                'Choose an image from your gallery or take a new one.',
              ),
              const SizedBox(height: 20),
              // This is where the selected image or a placeholder is shown
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                        // Placeholder image URL
                        'https://i.stack.imgur.com/l60Hf.png',
                      ),
                    ),
              const SizedBox(height: 20),
              // Icons for camera and gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library),
                    onPressed: selectImageFromGallery,
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: selectImageFromCamera,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Next button
              ElevatedButton(
                onPressed: () {
                  // We will connect this to the signup logic in the next step
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
