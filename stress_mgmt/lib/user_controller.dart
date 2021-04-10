import 'package:get/get.dart';

class UserController extends GetxService {
  Rx<String> _username = "".obs;

  set username(String s) => _username.value = s;
  String getUsername() => _username.value;

  Future<UserController> init() async {
    return this;
  }
}
