import 'package:get/get.dart';
import 'package:stenli/data/model/user.dart';

class Cuser extends GetxController {
  final _data = User().obs;
  User get data => _data.value;
  setData(n) => _data.value = n;
}
