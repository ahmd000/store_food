import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:store_app/helpers/helpers.dart';
import 'package:store_app/models/favorite_product.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class FavoriteProductController with Helpers {
  Future<bool> addFavorite(BuildContext context,
      {required int productId}) async {
    var url = Uri.parse(ApiSettings.favorite);
    var response = await http.post(
      url,
      body: {
        "product_id": productId.toString(),
      },
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      showSnackBar(context: context,message: jsonDecode(response.body)['message']);
      return true;
    } else {
      showSnackBar(context: context,message: jsonDecode(response.body)['message'], error: true);
      return false;
    }
  }




  ///
///
///
  Future<List<FavoriteProduct>> showFavoriteProduct() async {
    var url = Uri.parse(ApiSettings.favorite );
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    print("Favorite List: ${jsonDecode(response.body)}");

    //  print("status0000000101010202 : ${jsonDecode(response.body)['list'] } ");
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['list'] as List;

      print("object: 00000000000000000     ${result}");

      List<FavoriteProduct> list = result
          .map((jsonObject) => FavoriteProduct.fromJson(jsonObject))
          .toList();
     // print("length: 00000000000000000     ${result.length}");
      return list;
    }
    return [];
  }
}



