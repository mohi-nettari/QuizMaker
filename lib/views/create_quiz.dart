import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:random_string/random_string.dart';

import '../widgets/widgets.dart';
import 'AddQuistions.dart';

class creatquiz extends StatefulWidget {
  const creatquiz({Key? key}) : super(key: key);

  @override
  _creatquizState createState() => _creatquizState();
}

class _creatquizState extends State<creatquiz> {
  final _formKey = GlobalKey<FormState>();
  late String imageUrl, quizName, quizDesc, quizId;
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  //inserting quiz data to the database.
  createQuizOnline() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizTitle": quizName,
        "quizImage": imageUrl,
      };

      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddQuistions(quizId)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: Column(
                  //creating a quiz's text fields.
                  children: [
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty ? "Enter a correct quiz Image" : null;
                      },
                      decoration: InputDecoration(hintText: "Quiz Image URL"),
                      onChanged: (val) {
                        //TODO
                        imageUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty ? "Enter a correct Quiz Title" : null;
                      },
                      decoration: InputDecoration(hintText: "Quiz Title"),
                      onChanged: (val) {
                        //TODO
                        quizName = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) {
                        val!.isEmpty
                            ? "Enter a correct Quiz Description"
                            : null;
                      },
                      decoration: InputDecoration(hintText: "Quiz Description"),
                      onChanged: (val) {
                        //TODO
                        quizDesc = val;
                      },
                    ),
                    Spacer(),
                    //inserting quiz data to database (button).
                    GestureDetector(
                        onTap: () {
                          //create quiz button
                          createQuizOnline();
                        },
                        child: blueButton(context : context, name: "Create Quiz")),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
