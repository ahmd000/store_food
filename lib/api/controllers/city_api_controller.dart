import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:store_app/models/city.dart';

import '../api_settings.dart';

class CityApiController {

  Future<List<City>> getCity() async {
    var url = Uri.parse(ApiSettings.city);
    var response = await http.get(url,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var cityJsonArray = jsonDecode(response.body)['list']as List;
      return cityJsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

}