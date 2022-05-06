import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  //insert quiz data to database
  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  //insert questions data to database.
  Future<void> addQestionData(Map questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("Q&A")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuestionsData(String id) async{
    return await FirebaseFirestore.instance
        .collection("Quiz")
    .doc(id)
    .collection("Q&A")
        .getDocs();
  }

}
