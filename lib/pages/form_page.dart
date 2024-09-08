import 'package:drchef/models/ai_model.dart';
import 'package:drchef/models/form_model.dart';
import 'package:drchef/theme.dart';
import 'package:drchef/utils/constant.dart';
import 'package:drchef/widgets/add_image.dart';
import 'package:drchef/widgets/form_image_container.dart';
import 'package:drchef/widgets/form_widget.dart';
import 'package:drchef/widgets/prompt_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController alergiesController = TextEditingController();
  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

  final FormModel formModel = FormModel();

  void submitForm() async {
    formModel.nameSetter = nameController.text;
    formModel.diseaseSetter = diseaseController.text;
    formModel.ageSetter = ageController.text;
    formModel.alergiesSetter = alergiesController.text;
    formModel.imagesSetter = images;

    final response = await generate(prompt, images);

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          backgroundColor: appBarColor,
          title: const Center(child: Text("Create a diet plan")),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormImageContainer(
              addImage: AddImage(onTap: _pickImage),
              imageWidget: images
                  .map(
                    (i) => PromptImage(
                      file: i ?? XFile(''),
                      onTapIcon: () {
                        setState(() {
                          images.remove(i);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormWidget(
              nameController: nameController,
              diseaseController: diseaseController,
              ageController: ageController,
              alergiesController: alergiesController,
              submitForm: () => submitForm(),
            ),
          ),
        ),
      ],
    ));
  }
}
