import 'package:store_app/prefs/shared_pref_controller.dart';

class City {
  late int id;
  late String nameEn;
  late String nameAr;
  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }


  String get cityName =>
      SharedPrefController().language == 'en' ? nameEn : nameAr;
}
