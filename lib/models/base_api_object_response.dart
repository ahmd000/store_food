import 'package:store_app/models/Users.dart';
import 'package:store_app/models/base_api_Response.dart';
import 'package:store_app/models/home_response.dart';

class BaseApiObjectResponse<T> extends BaseApiResponse {
  late T object;
  late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json.containsKey('data')) {
      if (T == Users) {
        data = Users.fromJson(json['data']) as T;
      } else if (T == HomeResponse) {
        data = HomeResponse.fromJson(json['data']) as T;
      }
    }
    if (json.containsKey('object')) {
      //
    }
  }
}
