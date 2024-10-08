import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drchef/theme.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _getRecipes() async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('diet')
          .doc('zuDu3xm3f10SWMxWxlGl')
          .get();

      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        final List<String> dishes = data['diet'] as List<String>;

        for (var dish in dishes) {
          print(dish);
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

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
          child: Text('hi'),
        )
      ],
    ));
  }
}
