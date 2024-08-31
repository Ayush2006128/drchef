import 'package:flutter/widgets.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "recipe",
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
