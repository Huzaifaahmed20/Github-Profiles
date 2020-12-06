class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.github.com";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  static const String userInfo = '/users';
  static const String repos = '/repos';
}
