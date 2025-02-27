import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/constants/colors.dart';
import 'package:rio_cupones/src/pages/user/register/user_register_controller.dart';

class UserRegisterPage extends StatelessWidget {
  UserRegisterController con = Get.put(UserRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
        ],
      ),
    );
  }

  //--Widgets visibles en la pantalla--
  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        gradient: LinearGradient(
          colors: [
            primary_color, // Verde claro
            accent, // Amarillo oro
          ],
          begin: Alignment.topCenter, // Inicio del degradado
          end: Alignment.bottomCenter, // Fin del degradado
        ),
      ),
    );
  }

  //** Box Form  */
  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      padding: const EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1, left: 35, right: 35),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: background_form,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color.fromARGB(180, 11, 51, 6),
              blurRadius: 20,
              offset: Offset(0, 0.8),
            )
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textTitle(),
            _imageUser(context),
            _textfieldEmail(),
            _textfieldName(),
            _textfieldLastname(),
            _textfieldPhone(),
            _textfieldPassword(),
            _textfieldConfirmPassword(),
            _buttonRegister(context),
          ],
        ),
      ),
    );
  }

  // -- Widgets del form --
  Widget _textTitle() {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 10),
      child: Text(
        'Registro de usuario',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: secondary_color,
        ),
      ),
    );
  }

  /// Imagen de usuario
  Widget _imageUser(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/usuario.png'),
          radius: 60,
          backgroundColor: primary_color,
        ),
      ),
    );
  }

  Widget _textfieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Correo Electrónico',
          hintText: 'Correo Electrónico',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _textfieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Nombre',
          hintText: 'Nombre',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _textfieldLastname() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: TextField(
        controller: con.lastnameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Apellido',
          hintText: 'Apellido',
          prefixIcon: Icon(Icons.person_2_outlined),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _textfieldPhone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Teléfono',
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _textfieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          hintText: 'Contraseña',
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _textfieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirmar Contraseña',
          hintText: 'Confirmar Contraseña',
          prefixIcon: Icon(Icons.password_rounded),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primary_color)),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: 50,
      child: FilledButton.tonalIcon(
        onPressed: () {
          return con.registrar(context);
        },
        label: Text(
          'Registrarse',
          style: TextStyle(
            color: secondary_color,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.app_registration),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(primary_color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
            ),
          ),
        ),
      ),
    );
  }
}
