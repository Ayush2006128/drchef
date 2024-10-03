import 'package:drchef/models/ai_model.dart';
import 'package:drchef/models/form_model.dart';
import 'package:drchef/models/response_model.dart';
import 'package:drchef/theme.dart';
import 'package:drchef/utils/constant.dart';
import 'package:drchef/widgets/diet_plan_widget.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: appBarColor,
            title: const Center(child: Text("Create a diet plan")),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: context.size!.width * 0.8,
              height: context.size!.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (responseModel != null && dishes != null)
                    Expanded(
                      child: DietPlanWidget(
                        dishes: [for (var i in dishes!) Text(i)],
                      ),
                    ),
                  if (responseModel == null) const CircularProgressIndicator(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
