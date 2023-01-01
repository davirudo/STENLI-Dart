import 'dart:convert';

import 'package:get/get.dart';
import 'package:stenli/data/model/user.dart';
import '../presentation/controller/c_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);
    if (success) {
      final cUser = Get.put(Cuser());
      cUser.setData(user);
    }
    return success;
  }

  static Future<User> getUser() async {
    User user = User(); //default
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(Cuser());
    cUser.setData(user);

    return user;
  }

  static Future<bool> clearUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(Cuser());
    cUser.setData(User());
    return success;
  }
}
