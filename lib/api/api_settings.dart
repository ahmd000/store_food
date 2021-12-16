class ApiSettings {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiBaseUrl = _baseUrl + "api/";
  static const city = 'https://smart-store.mr-dev.tech/api/cities';
  static const String storeApiKey = '458310ba-02b2-45b5-8eaf-87df40bdafa3';

  static const login = _apiBaseUrl + 'auth/login';
  static const registerApi = _apiBaseUrl + 'auth/register';
  static const activatePhone = _apiBaseUrl + 'auth/activate';
  static const logout = _apiBaseUrl + 'auth/logout';
  static const forgetPassword = _apiBaseUrl + 'auth/forget-password';
  static const resetPassword = _apiBaseUrl + 'auth/reset-password';

  static const home = _apiBaseUrl + 'home';
  static const categories = _apiBaseUrl + 'categories/';
  static const sub_categories = _apiBaseUrl + 'sub-categories/';
  static const products = _apiBaseUrl + 'products/';
  static const offers = _apiBaseUrl + 'offers';


}
