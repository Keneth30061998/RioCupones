import 'package:get/get.dart';

class LoginController extends GetxController {
  void goToUserRegisterPage() {
    Get.toNamed('/user-register');
  }

  void goToAdminHome() {
    Get.toNamed('/admin-home');
  }
}
