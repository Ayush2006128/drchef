import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drchef/models/response_model.dart';
import 'package:drchef/theme.dart';
import 'package:drchef/utils/fetch_id.dart';
import 'package:drchef/widgets/diet_plan_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ResponseModel responseModel = ResponseModel();
  List plan = [];
  Future<void> _getRecipes() async {
    final id = await getLatestId('diet');
    try {
      final DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('diet').doc(id).get();

      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        final String dishes = data['diet'] as String;
        responseModel = ResponseModel(text: dishes);
        plan = responseModel.parseResponse()['dishes'];
      } else {
        throw 'Document does not exist';
      }
    } catch (e) {
      // show error dialog
      throw "somthing went wrong $e";
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
          SliverToBoxAdapter(
            child: plan.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 800,
                      height: 500,
                      child: DietPlanWidget(
                        dishes: [for (var i in plan) Text(i)],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
