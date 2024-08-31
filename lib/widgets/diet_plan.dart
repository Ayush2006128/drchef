import 'package:flutter/widgets.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "body",
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
