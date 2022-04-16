import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

import 'create_quiz.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ) ,
      ) ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add) ,
      backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> creatquiz()));
      },
      ),

    );
  }
}
