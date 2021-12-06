class Users {
  Users();
  late final int id;
  late final String password;
  late final String name;
  late final String mobile;
  late final String gender;
  late final bool active;
  late final bool verified;
  late final int cityId;
  late final int storeId;
  late final String fcmToken;
  late final String token;
  late final String tokenType;
  late final String refreshToken;
  late final City city;

  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    password = json['password'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    city = City.fromJson(json['city']);
  }


}

class City {
  City({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });
  late final int id;
  late final String nameEn;
  late final String nameAr;

  City.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_en'] = nameEn;
    _data['name_ar'] = nameAr;
    return _data;
  }
}