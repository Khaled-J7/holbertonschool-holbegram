import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class StorageMethods {
  // Specific Cloudinary details
  final String _cloudinaryUrl =
      'https://api.cloudinary.com/v1_1/dpxrt7jdh/image/upload';
  final String _uploadPreset = 'holbegram_preset';

  /// Uploads an image file to Cloudinary storage.
  Future<String> uploadImageToStorage({
    bool isPost = false,
    required String childName,
    required Uint8List file,
  }) async {
    try {
      // Create a unique ID for the file to avoid name conflicts
      String uniqueId = const Uuid().v1();
      var uri = Uri.parse(_cloudinaryUrl);

      // Create a multipart request for file upload
      var request = http.MultipartRequest('POST', uri);

      // Add the file to the request
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        file,
        filename: '${uniqueId}.jpg',
      );
      request.files.add(multipartFile);

      // Add the upload preset from Cloudinary settings
      request.fields['upload_preset'] = _uploadPreset;

      // Send the request
      var response = await request.send();

      // Check if the upload was successful
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var jsonResponse = jsonDecode(String.fromCharCodes(responseData));
        // Return the secure URL of the uploaded image
        return jsonResponse['secure_url'];
      } else {
        throw Exception('Failed to upload image to Cloudinary');
      }
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}
