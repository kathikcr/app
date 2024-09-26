import 'package:flutter/material.dart';
import 'package:front_end_sih/views/HomePage.dart';
import 'package:front_end_sih/views/Results.dart';
import 'package:front_end_sih/views/about.dart';
import 'package:front_end_sih/views/chatbot.dart';
import 'package:front_end_sih/views/contact_us.dart';
import 'package:front_end_sih/views/solutions.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Water Wizards",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: const Homepage(),
      routes: {
        '/result': (context) => const ResultScreen(),
        '/home': (context) => const Homepage(),
        '/about': (context) => const AboutMe(),
        '/chatbot': (context) => const Chatbot(),
        '/solutions': (context) => const Solutions(),
        '/contact': (context) => const ContactUs(),
      },
    );
  }
}
