import 'package:drchef/theme.dart';
import 'package:drchef/widgets/diet_plan.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          backgroundColor: appBarColor,
          title: const Center(child: Text("Welcome to Dr Chef!")),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form_page');
              },
              icon: const Icon(Icons.add_rounded),
            )
          ],
        ),
        const SliverToBoxAdapter(
          child: DietPlan(),
        )
      ],
    ));
  }
}
