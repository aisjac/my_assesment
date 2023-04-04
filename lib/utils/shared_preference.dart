import '../main.dart';

class SharedPreferenceUtils{
  static const String USER_ACCESS_TOKEN = "USER_ACCESS_TOKEN";


  static storeUserAccessToken(String token) {
    prefs?.setString(USER_ACCESS_TOKEN, token);
  }

  static String getUserAccessToken() {
    return prefs?.getString(USER_ACCESS_TOKEN) ?? '';
  }
}