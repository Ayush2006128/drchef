import 'package:flutter/material.dart';

class DietPlanWidget extends StatelessWidget {
  const DietPlanWidget({super.key, this.dishes});
  final List<Widget>? dishes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      width: context.size!.width * 0.8,
      height: context.size!.height * 0.9,
      child: Expanded(
        child: ListView.builder(
          itemCount: dishes!.length,
          itemBuilder: (context, index) {
            final dish = dishes![index];
            return dish;
          },
        ),
      ),
    );
  }
}
