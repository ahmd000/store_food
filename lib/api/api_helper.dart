import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';

mixin ApiHelper {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: Duration(seconds: 5),
        elevation: 20.0,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  void showSnackBarAction(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        content: Text(
          message,
        ),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: Duration(seconds: 20 ),
        elevation: 20.0,

        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  Map<String, dynamic>? get headers {
    var headers = {
      "accept": "application/json",
      "lang": SharedPrefController().setLanguage,
      //"Authorization": "Bearer TOKEN",
    };
    // if (SharedPrefController().loggedIn)
    //   headers["Authorization"] = "Bearer TOKEN";
    return headers;
  }
}
