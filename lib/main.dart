import 'package:flutter/material.dart';
import 'package:quizmaker/views/home.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizmaker/views/signup.dart';
import 'firebase_options.dart'; // Generated file
import 'package:http/http.dart' as http;

import 'helper/functions.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
 bool _isLoggedIn = false;

  @override
  void initState() {
    checkUserIsLogedInStatus();
    // TODO: implement initState
    super.initState();
  }

  //checking if the user is logged in.
  checkUserIsLogedInStatus() async {
    HelperFunctions.getUerLoggedInDetails().then((value) {
     setState(() {
       _isLoggedIn = value!;
     });
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      //if is logged in it will show the home screen otherwise it will show the sign in secreen.
      (_isLoggedIn ?? false) ? Home() : SignIn(),
    );
  }
}
