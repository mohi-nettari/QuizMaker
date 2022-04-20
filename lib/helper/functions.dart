import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //saving the logged in status of user.
  static String UserLoggedInKey = "ISLOGGEDIN";


  static saveUserLoggedInSharedPreference({required bool isUserLoggedIn}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     preferences.setBool(UserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool?> getUerLoggedInDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getBool(UserLoggedInKey);
  }
}
