import 'package:drchef/firebase_options.dart';
import 'package:drchef/pages/form_page.dart';
import 'package:drchef/pages/home_page.dart';
import 'package:drchef/pages/recipe_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/form_page': (context) => const FormPage(),
        '/recipe_page': (context) => const RecipePage()
      },
    );
  }
}