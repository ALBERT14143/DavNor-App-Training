import 'package:davnor_get/app/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedAccount {

  SharedAccount._();
  static final SharedAccount instance = SharedAccount._();

  String KEY = "USER";

  Future set(User user) async {
    final sharedPref = await SharedPreferences.getInstance();
    return await sharedPref.setString(KEY, user.toJson());
  }

  Future<User> get() async {
    final sharedPref = await SharedPreferences.getInstance();
    var data = await sharedPref.getString(KEY);
    return User.fromJson(data!);
  }

  Future<bool> check() async {
    final sharedPref = await SharedPreferences.getInstance();
    return await sharedPref.containsKey(KEY);
  }

  Future<bool> remove() async {
    final sharedPref = await SharedPreferences.getInstance();
    return await sharedPref.remove(KEY);
  }
}