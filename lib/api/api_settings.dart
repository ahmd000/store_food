class ApiSettings {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiBaseUrl = _baseUrl + "api/";
  // static const _baseUrl =
  //     "https://www.getpostman.com/collections/29f1b7facfb14730d905/";

  static const login = _apiBaseUrl + 'auth/login';
  static const home = _apiBaseUrl + 'home';
  static const registerApi = _apiBaseUrl + 'auth/register';
  static const activatePhone = _apiBaseUrl + 'auth/activate';
  static const categories = _apiBaseUrl + 'categories';
  static const String storeApiKey =
      '458310ba-02b2-45b5-8eaf-87df40bdafa3';

  static const logout = _apiBaseUrl + 'auth/logout';

  static const forgetPassword = _apiBaseUrl + 'auth/forget-password';
  static const resetPassword = _apiBaseUrl + 'auth/reset-password';
  static const city = 'https://smart-store.mr-dev.tech/api/cities';
}
