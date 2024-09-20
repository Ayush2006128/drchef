import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class FormModel {
  String? name = '';
  String? disease = '';
  String? age = '';
  String? alergies = '';
  List<XFile?> images = [XFile.fromData(Uint8List.fromList(''.codeUnits))];

  // getters
  get nameGetter => name;
  get diseaseGetter => disease;
  get ageGetter => age;
  get alergiesGetter => alergies;
  get imagesGetter => images;

  // setters
  set nameSetter(value) => name = value;
  set diseaseSetter(value) => disease = value;
  set ageSetter(value) => age = value;
  set alergiesSetter(value) => alergies = value;
  set imagesSetter(value) => images = value;
  String getPrompt() {
    return """
given images of medical reports or prescription make a diet plan for a week.
all the dishes must taste good 
my disease: $disease
my age: $age
my alergies: $alergies
all the dishes should be very healthy
and should be vegetarian or vegan 

respond in JSON format like this 'dishes: List<String>'
""";
  }
}
