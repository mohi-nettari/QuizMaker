import 'package:flutter/material.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizmaker/views/signup.dart';
import 'firebase_options.dart'; // Generated file
import 'package:http/http.dart' as http;

// void main() {
//   //WidgetsFlutterBinding.ensureInitialized();
//   //await Firebase.initializeApp();
//  // Firebase.initializeApp();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
    );
  }
}
