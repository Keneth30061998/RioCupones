import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final SplashController con = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/cupon-de-descuento.png',
              height: 150,
              width: 150,
            ),
            Text(
              'Cupones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C3F41),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => LinearProgressIndicator(
                    value: con.progress.value / 100,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blueAccent,
                    minHeight: 8,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            //Contador de Progreso
            Obx(() => Text(
                  '${con.progress.value.toInt()}%',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0x623C3F41)),
                ))
          ],
        ),
      ),
    );
  }
}
