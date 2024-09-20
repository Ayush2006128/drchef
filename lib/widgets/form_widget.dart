import 'package:drchef/theme.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController diseaseController;
  final TextEditingController ageController;
  final TextEditingController alergiesController;
  final void Function() submitForm;

  const FormWidget({
    super.key,
    required this.nameController,
    required this.diseaseController,
    required this.ageController,
    required this.alergiesController,
    required this.submitForm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.green.shade50,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const Text("Your Name"),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your name'),
            controller: nameController,
          ),
          const Text("Disease"),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your disease'),
            controller: diseaseController,
          ),
          const Text("Your Age"),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your age'),
            controller: ageController,
          ),
          const Text("Your Alergies"),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your alergies'),
            controller: alergiesController,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(50, 50),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: textColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
