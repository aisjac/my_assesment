class ApiUrl{

  /// Base URL
  static const baseUrl =
      "http://188.166.223.189/api/v1";

  static String logInUrl = "$baseUrl/login";

  static String userListUrl(String userType) {
    return "$baseUrl/user-data/$userType";
  }

}