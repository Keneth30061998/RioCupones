import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/constants/colors.dart';
import 'package:rio_cupones/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController con = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        children: [
          _backgroudCover(context),
          _boxForm(context),
          _imageCover(),
          _textTitle(),
        ],
      ),
    );
  }

  ///-------------------------------------
  ///Widgets creados por separado
  Widget _backgroudCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            primary_color, // Verde claro
            accent, // Amarillo oro
          ],
          begin: Alignment.topCenter, // Inicio del degradado
          end: Alignment.bottomRight, // Fin del degradado
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.33,
        left: 50,
        right: 50,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: lightGray,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textWelcome(),
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/img/logo_cupones.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }

  Widget _textTitle() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          top: 180,
        ),
        alignment: Alignment.topCenter,
        child: Text(
          'RioCupones',
          style: TextStyle(
            color: secondary_color,
            fontWeight: FontWeight.bold,
            fontSize: 38,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  ///--- Widgets que estan dentro de los contenedores---
  //Widget de Texto
  Widget _textYourInfo() {
    return Text(
      'Ingrese sus credenciales',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: secondary_color,
      ),
    );
  }

  Widget _textWelcome() {
    return Text(
      'Bienvenido!',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: secondary_color,
      ),
    );
  }

  //Widget input de texto - Email
  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 25,
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  //Widget input de texto - password
  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
        obscureText: true,
      ),
    );
  }

  //Widget boton de accion - login
  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      child: FloatingActionButton.extended(
        onPressed: () => con.goToAdminHome(),
        label: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.login_outlined),
        elevation: 0,
      ),
    );
  }

  //Widget Bottom Text - Registrate
  Widget _textDontHaveAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¿No tienes una cuenta?  ',
            style: TextStyle(
              color: darkGray,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: () => con.goToUserRegisterPage(),
            child: Text(
              'Registrate Aqui',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.5,
                color: secondary_color,
              ),
            ),
          )
        ],
      ),
    );
  }
}
