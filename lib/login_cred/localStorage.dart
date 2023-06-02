import 'package:shared_preferences/shared_preferences.dart';

void saveUserDetails(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  prefs.setString('password', password);
}

checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');

  if (email != null && password != null) {
    return true;
  } else {
    return false;
  }
}

void clearUserDetails() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('email');
  prefs.remove('password');
}
