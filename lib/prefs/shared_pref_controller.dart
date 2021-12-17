import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/Users.dart';

enum PrefKeys {
  id,
  name,
  password,
  mobile,
  gender,
  active,
  verified,
  storeId,
  fcmToken,
  token,
  tokenType,
  refreshToken,
  cityEn,
  cityAr,
  loggedIn,
  lang
}

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  String get gender => _sharedPreferences.getString('gender') ?? "";
  int get city_id => _sharedPreferences.getInt('city_id') ?? 0;
  String get userName => _sharedPreferences.getString('name') ?? "";

  Future<void> save({required Users user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(PrefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(
        PrefKeys.cityEn.toString(), user.city.nameEn);
    await _sharedPreferences.setString(
        PrefKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPreferences.setString(PrefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(PrefKeys.token.toString(), user.token);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }

  Future<bool> logout() async {
    return await _sharedPreferences.setBool(
        PrefKeys.loggedIn.toString(), false);
  }



  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  Future<bool> setLanguage(String codeLang) async{
    return await _sharedPreferences.setString("CodeLang", codeLang);
  }

  String get language =>
      _sharedPreferences.getString(PrefKeys.lang.toString()) ?? 'en';




  Future<bool> setGender(String gender) async{
    return await _sharedPreferences.setString('gender', gender);

  }


  Future<bool> setCityId(int cityId) async{
    return  await _sharedPreferences.setInt('city_id', cityId);

  }

  Future<bool> setUserName(String name) async{
    return await _sharedPreferences.setString('name', name);
  }

  String get codeLang => _sharedPreferences.getString("CodeLang") ?? "en";

}
