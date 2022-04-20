import 'package:flutter/material.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/views/signup.dart';
import 'package:quizmaker/widgets/widgets.dart';

import '../helper/functions.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  //sign in
  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      authService.signInEmailAndPAssword(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInSharedPreference(isUserLoggedIn: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
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
          //if its loading than show to the user the progress bar
          _isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              :

              //if its not loading
              Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      children: [
                        Spacer(),
                        TextFormField(
                          validator: (val) {
                            val!.isEmpty ? "Enter a correct email" : null;
                          },
                          decoration: InputDecoration(hintText: "mail"),
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
                            signIn();
                          },
                          child: blueButton(context: context, name: "Sign In"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account? ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Container(
                                  child: Text('Sign Up',
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
