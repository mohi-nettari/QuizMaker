import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/database.dart';
import 'QuizPlay.dart';
import 'create_quiz.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  late Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
        child: StreamBuilder(
          stream: quizStream,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return QuizTile(
                    // noOfQuestions: snapshot.data.documents.length,
                    imageUrl:
                    snapshot.data?.docs[index].data['quizImgUrl'],
                    title:
                    snapshot.data.docs[index].data['quizTitle'],
                    description:
                    snapshot.data.docs[index].data['quizDesc'],
                    quizId: snapshot.data.docs[index].data["quizId"],
                  );
                });
          },
        )

    );
    }

    @override
  void initState() {
    // TODO: implement initState
      databaseService.getQuizData().then((value){
        setState(() {
          quizStream = value;
        });
      });
      super.initState();
  }

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
      body: quizList(),
      //inserting a quiz button.
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => creatquiz()));
        },
      ),
    );
  }
  }

  class QuizTile extends StatelessWidget {
  final String imageUrl, title, quizId, description;

  QuizTile(
  {required this.title,
  required this.imageUrl,
  required this.description,
  required this.quizId,
    });

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
  onTap: (){
  Navigator.push(context, MaterialPageRoute(
  builder: (context) => QuizPlay(quizId)
  ));
  },
  child: Container(
  padding: EdgeInsets.symmetric(horizontal: 24),
  height: 150,
  child: ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: Stack(
  children: [
  Image.network(
  imageUrl,
  fit: BoxFit.cover,
  width: MediaQuery.of(context).size.width,
  ),
  Container(
  color: Colors.black26,
  child: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text(
  title,
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w500),
  ),
  SizedBox(height: 4,),
  Text(
  description,
  style: TextStyle(
  fontSize: 13,
  color: Colors.white,
  fontWeight: FontWeight.w500),
  )
  ],
  ),
  ),
  )
  ],
  ),
  ),
  ),
  );
  }
  }
