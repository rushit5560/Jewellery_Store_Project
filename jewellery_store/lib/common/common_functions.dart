import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CommonFunctions {

  // This Function Use For Hide Keyboard
  hideKeyBoard(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  // This Function Use For Set UserId & Toke in sharedPreference
  setUserDetailsInPrefs(id, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove('id');
    prefs.remove('token');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', true);
    prefs.setInt('id', id);
    prefs.setString('token', token);

  }
}