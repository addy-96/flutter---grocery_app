import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreServices {
  setUserDetails(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userData['username']);
    await prefs.setString('email', userData['email']);
  }

  getUserDetails(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
