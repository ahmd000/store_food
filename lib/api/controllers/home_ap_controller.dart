import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/api/api_helper.dart';
import 'package:store_app/api/api_settings.dart';
import 'package:store_app/models/base_api_object_response.dart';
import 'package:store_app/models/home_response.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';

class HomeApiController with ApiHelper {
  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    }
        // headers: headers,
        );
    print("status:");

    print(response.statusCode);

    if (response.statusCode == 200) {
      return BaseApiObjectResponse<HomeResponse>.fromJson(jsonDecode(response.body)).data;
    }
    return null;
  }



}