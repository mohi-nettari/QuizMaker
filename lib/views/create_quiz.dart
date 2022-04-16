import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class creatquiz extends StatefulWidget {
  const creatquiz({Key? key}) : super(key: key);

  @override
  _creatquizState createState() => _creatquizState();
}

class _creatquizState extends State<creatquiz> {
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
        child : Container(
        child: Column(
          children: [
            TextFormField(
              validator: (val){ val!.isEmpty ? "Enter a correct quiz Image" : null ;},
              decoration: InputDecoration(
                  hintText: "Quiz Image"
              ) ,
              onChanged: (val){
              },
            ),
            TextFormField(
              validator: (val){ val!.isEmpty ? "Enter a correct Quiz Title" : null ;},
              decoration: InputDecoration(
                  hintText: "Quiz Title"
              ) ,
              onChanged: (val){
              },
            ),
            TextFormField(
              validator: (val){ val!.isEmpty ? "Enter a correct Quiz Description" : null ;},
              decoration: InputDecoration(
                  hintText: "Quiz Description"
              ) ,
              onChanged: (val){
              },
            ),
            SizedBox(height: 200,),
            GestureDetector(
              onTap: ()  {
                //create a quiz
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Qreate Quiz",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
