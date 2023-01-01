import '../../config/api.dart';
import '../../config/app_request.dart';
import '../../config/session.dart';
import '../model/user.dart';

class SourceHistory {
    static Future<Map> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, '', {
      'email': email,
      'password': password,
    });
    if (responseBody == null) return {};

    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }
}