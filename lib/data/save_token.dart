import 'package:shared_preferences/shared_preferences.dart';

sealed class Store{
  static const String _tokenKey = "accessToken";
  static const String _refreshToken = "refreshToken";


  static Future<void> setToken(String token,String refToken) async{
    final preferences =await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
    await preferences.setString(_refreshToken, refToken);
  }

  static Future<String?> getToken() async{
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }

  static Future<String?> getRefreshToken() async{
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_refreshToken);
  }

  static Future<void> clear()async{
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}