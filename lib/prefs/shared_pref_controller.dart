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

  Future<void> setLanguage({required String lang}) async {
    await _sharedPreferences.setString(PrefKeys.lang.toString(), lang);
  }

  String get language =>
      _sharedPreferences.getString(PrefKeys.lang.toString()) ?? 'en';
}
