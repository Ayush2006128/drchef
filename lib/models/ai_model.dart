import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:image_picker/image_picker.dart';

final model =
    FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-pro');

Future<Uint8List> getImageData(XFile image) async {
  final file = File(image.path);
  return file.readAsBytes();
}

Future<String?> generate(String prompt, List<XFile?> images) async {
  final imageDataList = await Future.wait(
    images.map((image) async {
      if (image == null) {
        return null;
      }
      return await getImageData(image);
    }),
  );

  final response = await model.generateContent([
    Content.text(prompt),
    ...imageDataList
        .map((data) => Content.data('image/png', data!))
        .whereType<Content>(),
  ]);

  return response.text;
}
