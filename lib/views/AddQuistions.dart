import 'package:flutter/material.dart';

import '../services/database.dart';
import '../widgets/widgets.dart';

class AddQuistions extends StatefulWidget {
  final String quizId;
  AddQuistions(this.quizId);

  //const AddQuistions({Key? key}) : super(key: key);

  @override
  _AddQuistionsState createState() => _AddQuistionsState();
}

class _AddQuistionsState extends State<AddQuistions> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();
  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";

  //inserting questions to database function.
  submitQuistion(){
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      Map <String,String> questionData = {
        "question" : question,
        "option1" : option1,
        "option2" : option2,
        "option3" : option3,
        "option4" : option4,
      };
    databaseService.addQestionData(questionData , widget.quizId).then((value) {
      question = "";
      option1 = "";
      option2 = "";
      option3 = "";
      option4 = "";
      setState(() {
        _isLoading = false;
      });
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
    /*if is Loading (if inserting a question to database is progressing) it wil show a loading view
        if not than it will show the Home view*/
    body: _isLoading ?
    Container(child: Center(
      child: CircularProgressIndicator(),
    )
    ) :
    Form(
    key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          //question and answers text fields.
          children: [
            //inserting a question's text fields.
            TextFormField(
              validator: (val) {
                val!.isEmpty ? "Enter a correct quiz question" : null;
              },
              decoration: InputDecoration(hintText: "Question"),
              onChanged: (val) {
                //TODO
                question = val;
              },
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (val) {
                val!.isEmpty ? "Enter a correct quiz option" : null;
              },
              decoration: InputDecoration(hintText: "Option_1"),
              onChanged: (val) {
                //TODO
                option1 = val;
              },
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (val) {
                val!.isEmpty ? "Enter a correct quiz option" : null;
              },
              decoration: InputDecoration(hintText: "Option_2"),
              onChanged: (val) {
                //TODO
                option2 = val;
              },
            ),
            SizedBox(
              height: 6,
            ),TextFormField(
              validator: (val) {
                val!.isEmpty ? "Enter a correct quiz option" : null;
              },
              decoration: InputDecoration(hintText: "Option_3"),
              onChanged: (val) {
                //TODO
                option3 = val;
              },
            ),
            SizedBox(
              height: 6,
            ),TextFormField(
              validator: (val) {
                val!.isEmpty ? "Enter a correct quiz option" : null;
              },
              decoration: InputDecoration(hintText: "Option_4"),
              onChanged: (val) {
                //TODO
                option4 = val;
              },
            ),
          Spacer(),
            //inserting a question and submiting buttons.
            Row(
              children: [
                //submit button
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: blueButton(context: context, name: "Submit",
                        buttonWidth: MediaQuery.of(context).size.width/2 - 36) ,
                ),
                SizedBox(
                  width: 10,
                ),
                //inserting a question to the database.
                GestureDetector(
                  onTap: (){
                    submitQuistion();
                  },
                  child: blueButton(
                      context: context, name: "Add Question",
                      buttonWidth: MediaQuery.of(context).size.width/2 - 36) ,

                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),

    )
    );
  }
}
