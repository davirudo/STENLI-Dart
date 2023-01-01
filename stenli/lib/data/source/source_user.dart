import 'package:stenli/config/api.dart';
import 'package:stenli/config/app_request.dart';
import 'package:stenli/config/session.dart';
import 'package:stenli/data/model/user.dart';

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, '', {
      'email': email,
      'password': password,
    });
    if (responseBody == null) return false;

    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }
}
