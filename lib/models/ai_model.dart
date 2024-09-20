import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class ModelClass {
  GenerativeModel model;
  String? prompt;
  List<XFile?> image;
  ModelClass(this.model, this.prompt, this.image);

  Future<GenerateContentResponse> generate() async {
    final content = [
      Content.multi([
        TextPart(prompt ?? ''),
        for (var i in image) DataPart('image/png', await i!.readAsBytes())
      ])
    ];

    final response = await model.generateContent(content);
    return response;
  }
}
