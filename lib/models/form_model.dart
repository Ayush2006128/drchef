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
}
