import 'dart:async';

import 'package:get/get.dart';

import '../login/login_page.dart';

class SplashController extends GetxController {
  var progress = 0.0.obs; //observable para actualizar la UI
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _startLoading();
  }

  //clase para cargar la pagina
  void _startLoading() {
    timer = Timer.periodic(Duration(milliseconds: 30), (t) {
      if (progress.value < 100) {
        progress.value += 1;
      } else {
        t.cancel();
        _navigateToLogin();
      }
    });
  }

  //clase para moverse de pantalla
  void _navigateToLogin() {
    Get.off(LoginPage());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    timer.cancel();
    super.onClose();
  }
}
