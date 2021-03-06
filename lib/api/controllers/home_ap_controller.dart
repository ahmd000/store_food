import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/api/api_helper.dart';
import 'package:store_app/api/api_settings.dart';
import 'package:store_app/models/SubCategories.dart';
import 'package:store_app/models/base_api_object_response.dart';
import 'package:store_app/models/home_response.dart';
import 'package:store_app/models/product_subcategory.dart';
import 'package:store_app/models/products.dart';
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
      return BaseApiObjectResponse<HomeResponse>.fromJson(
              jsonDecode(response.body))
          .data;
    }
    return null;
  }

  Future<List<SubCategory>> showSubCategory(int idCat) async {
    var url = Uri.parse(ApiSettings.categories + idCat.toString());
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    print("status : ${response.statusCode} ");
    if (response.statusCode == 200) {
      var name = jsonDecode(response.body)['list'] as List;

      List<SubCategory> list =
          name.map((jsonObject) => SubCategory.fromJson(jsonObject)).toList();
      print(list.length);
      return list;
    }
    return [];
  }

  Future<List<ProductSubCategory>> showSubCategoryProduct(int idCat) async {
    var url = Uri.parse(ApiSettings.sub_categories + idCat.toString());
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

  //  print("status0000000101010202 : ${jsonDecode(response.body)['list'] } ");
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['list'] as List;

      print("object: 00000000000000000     ${result}");

      List<ProductSubCategory> list = result
          .map((jsonObject) => ProductSubCategory.fromJson(jsonObject))
          .toList();
      print("length: 00000000000000000     ${result.length}");
      return list;
    }
    return [];
  }
}
