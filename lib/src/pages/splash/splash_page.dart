import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/constants/colors.dart';
import 'package:rio_cupones/src/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final SplashController con = Get.put(SplashController());

  SplashPage({super.key});

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
                color: secondary_color,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Obx(() => LinearProgressIndicator(
                    value: con.progress.value / 100,
                    backgroundColor: Colors.grey[300],
                    color: primary_color,
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
                      color: secondary_color),
                ))
          ],
        ),
      ),
    );
  }
}
