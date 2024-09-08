import 'package:drchef/models/form_model.dart';
import 'package:image_picker/image_picker.dart';

List<XFile?> images = [];
final formModel = FormModel();
final prompt = """
given images of medical reports or prescription make a diet plan for a week.
all the dishes must taste good 
my disease: ${formModel.disease}
my age: ${formModel.age}
my alergies: ${formModel.alergies} 

respond in JSON format like this 'dishes: List<String>'
""";
