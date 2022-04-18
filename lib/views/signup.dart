//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/views/signin.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:quizmaker/services/auth.dart';
import '../widgets/widgets.dart';
//import 'package:http/http.dart' as http;
//import 'package:universal_html/html.dart' as html;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, password;
  bool _isLoading = false;
  AuthService authService = new AuthService();

  SignUp() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      authService.signUpWithEmailAndPassword(email, password).then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        }
      });
    }
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
      body:
          //if is loading will show a progress view
          _isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              :
              //if not loading will show the main view
              Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      children: [
                        Spacer(),
                        TextFormField(
                          validator: (val) {
                            return val!.isEmpty ? "Enter a correct name" : null;
                          },
                          decoration: InputDecoration(hintText: "Name"),
                          onChanged: (val) {
                            name = val;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          validator: (val) {
                            return val!.isEmpty
                                ? "Enter a correct email"
                                : null;
                          },
                          decoration: InputDecoration(hintText: "Email"),
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val!.isEmpty
                                ? "Enter a correct password"
                                : null;
                          },
                          decoration: InputDecoration(hintText: "Password"),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            //signup button
                            SignUp();
                            // getInfoAndSignUp();
                          },
                          child: blueButton(context : context, name: "Sign Up"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Container(
                                  child: Text('Sign In',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          fontSize: 17)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  )),
    );
  }
}
