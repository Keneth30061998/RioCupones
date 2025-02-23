import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/constants/app_theme.dart';
import 'package:rio_cupones/src/pages/splash/splash_page.dart';
import 'package:rio_cupones/src/pages/user/register/user_register_page.dart';

void main() {
  runApp(const MyApp());
}

//Para manejar Getx eliminamos todo y volvemos a crear (1)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //creamos un init (2)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RioCupones',
      theme: getThemeData(context),

      //establecemos la ruta inicial y demas rutas (4)
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/user-register', page: ()=>UserRegisterPage())
      ],
      navigatorKey: Get.key,
    ); //Retornamos un GetMaterialApp -> get (3)
  }
}
