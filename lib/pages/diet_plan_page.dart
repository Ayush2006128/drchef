import 'package:drchef/models/ai_model.dart';
import 'package:drchef/models/form_model.dart';
import 'package:drchef/models/response_model.dart';
import 'package:drchef/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class DietPlanPage extends StatefulWidget {
  const DietPlanPage({super.key});

  @override
  State<DietPlanPage> createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  final model = GenerativeModel(
      model: "gemini-1.5-flash-latest", apiKey: dotenv.get('API_KEY'));
  String prompt = FormModel().getPrompt();
  ModelClass? modelClass; // Declare modelClass here
  ResponseModel? responseModel;
  List? dishes;

  @override
  void initState() {
    super.initState();

    // Create ModelClass instance
    modelClass = ModelClass(
      model,
      prompt,
      images.map((image) => image).toList(),
    );

    // Generate response asynchronously
    _generateResponse();
  }

  Future<void> _generateResponse() async {
    try {
      final response = await modelClass!.generate();
      setState(() {
        responseModel = ResponseModel(text: response.text);
        dishes = responseModel?.parseResponse()["dishes"];
      });
    } catch (e) {
      // Handle errors gracefully, e.g., display an error message
      print("Error generating response: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responseModel != null && dishes != null)
            Expanded(
              child: ListView.builder(
                itemCount: dishes!.length,
                itemBuilder: (context, index) {
                  final dish = dishes![index];
                  return ListTile(
                    title: Text(dish),
                  );
                },
              ),
            ),
          if (responseModel == null) const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
