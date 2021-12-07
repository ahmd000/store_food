class ApiSettings {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiBaseUrl = _baseUrl + "api/";
  // static const _baseUrl =
  //     "https://www.getpostman.com/collections/29f1b7facfb14730d905/";

  static const registerApi = _apiBaseUrl + 'auth/register/';
  static const login = _apiBaseUrl + 'auth/login/';
  static const logout = _apiBaseUrl + 'auth/logout/';

  static const forgetPassword = _apiBaseUrl + 'auth/forget-password/';
  static const resetPassword = _apiBaseUrl + 'auth/reset-password/';
  static const citiesLise = 'https://smart-store.mr-dev.tech/api/cities';
}
