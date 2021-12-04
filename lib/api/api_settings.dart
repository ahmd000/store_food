class ApiSettings {
  static const _baseUrl = "https://www.getpostman.com/collections/29f1b7facfb14730d905/";
  // static const _imageUrl = _baseUrl + "images/";
  // static const _apiUrl = _baseUrl + "api/";

  // static getImageUrl(String image) {
  //   return _imageUrl + image;
  // }

  // static const users = _apiUrl + 'users';
  // static const categories = _apiUrl + 'categories';

  static const register = _baseUrl + 'auth/register/';
  static const login = _baseUrl + 'auth/login/';
  static const logout = _baseUrl + 'auth/logout/';

  static const forgetPassword = _baseUrl + 'auth/forget-password/';
  static const resetPassword = _baseUrl + 'auth/reset-password/';

  // static const images = _apiUrl + 'student/images/{id}';
}
