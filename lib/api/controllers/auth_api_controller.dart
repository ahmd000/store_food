import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/api/api_helper.dart';
import 'package:store_app/models/Users.dart';
import 'package:store_app/models/base_api_object_response.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';
import 'package:store_app/screens/LoginAndRegisterScreens/VerfictionScreen.dart';

import '../api_settings.dart';

class AuthApiController with ApiHelper {

  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'password': password,
      },
      headers: {'lang': 'ar'},
    );
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      BaseApiObjectResponse baseApiResponseObject = BaseApiObjectResponse<Users>.fromJson(jsonObject);
      await SharedPrefController().save(user: baseApiResponseObject.data);
      showSnackBar(
      context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
      context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }
  Future<bool> register(BuildContext context, {required Users user}) async {
    var url = Uri.parse(ApiSettings.registerApi);
    var response = await http.post(url, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'STORE_API_KEY': ApiSettings.storeApiKey,
      'city_id': user.cityId.toString(),
    });

    if (response.statusCode == 201) {
      print(jsonDecode(response.body)["code"]);
      showSnackBarAction(
        context,
        message:"${jsonDecode(response.body)['message']} \nYor verification Code: ${jsonDecode(response.body)["code"]} \n ",
      );


      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }


  Future<bool> activatePhone(BuildContext context,
      {required String mobile, required String code}) async {
    var url = Uri.parse(ApiSettings.activatePhone);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'code': code,
      },
      headers: {'lang': 'en'},
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body)['code']);
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(context,
          message: jsonDecode(response.body)['message'], error: true);
    } else if (response.statusCode == 500) {
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      'lang': 'en',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }

  Future<bool> forgetPassword(BuildContext context,
      {required String mobile}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
      },
      headers: {
        'lang': 'en',
      },
    );
    if (response.statusCode == 200) {
      showSnackBarAction(
        context,
        message:"${jsonDecode(response.body)['message']} \nYor verification Code: ${jsonDecode(response.body)["code"]} \n ",
      );
      print(response.statusCode);
      print(jsonDecode(response.body)['code']);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(context,
          message: jsonDecode(response.body)['message'], error: true);
    } else {
      print(response.statusCode);
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context,
      {required String mobile,
      required String code,
      required String password}) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'code': code,
      'password': password,
      'password_confirmation': password,
    }, headers: {
      'lang': 'en',
      HttpHeaders.acceptHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(context,
          message: jsonDecode(response.body)['message'], error: true);
    } else if (response.statusCode == 500) {
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }
}
