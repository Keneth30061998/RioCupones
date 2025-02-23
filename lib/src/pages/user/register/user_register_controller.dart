import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/models/User.dart';
import 'package:rio_cupones/src/providers/users_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class UserRegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  // Metodo Para Registrar
  void registrar(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    //llamado metodo de validacion del formulairo
    if(isValidForm(email, name, lastname, phone, password, confirmPassword)){

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 70, msg: "Registro de usuario");
      User user = User(name: name, lastname: lastname, email: email, phone: phone, password: password);
      Response response = await usersProvider.create(user);
      print('Response: ${response.body}');

      //Get.snackbar('Datos Válidos', 'Registro de usuario...');
      print('Email: ${email}');
      print('Nombre: ${name}');
      print('Password: ${password}');

      progressDialog.close();
    }
  }

  //Metodo para Validar los campos del Formulario
  bool isValidForm(
    String email,
    String name,
    String lastname,
    String phone,
    String password,
    String confirmPassword,
  ) {
    //validar que los datos ingresados sean valores 'validos'
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Email Incorrecto', 'Ingrese un email válido');
      return false;
    }
    if(!GetUtils.isUsername(name)){
      Get.snackbar('Nombre Incorrecto', 'Ingrese un nombre válido');
      return false;
    }
    if(!GetUtils.isUsername(lastname)){
      Get.snackbar('Apellido Incorrecto', 'Ingrese un apellido válido');
      return false;
    }
    if(!GetUtils.isPhoneNumber(phone)){
      Get.snackbar('Teléfono inválido', 'Ingrese un teléfono válido');
      return false;
    }

    //validar si los campos estan vacios
    if(email.isEmpty){
      Get.snackbar('Email vacío', 'Ingrese un email');
      return false;
    }
    if(name.isEmpty){
      Get.snackbar('Nombre vacío', 'Ingrese su nombre');
      return false;
    }
    if(lastname.isEmpty){
      Get.snackbar('Apellido vacío', 'Ingrese su apellido');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Teléfono vacío', 'Ingrese su teléfono');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Contraseña vacía', 'Ingrese su contraseña');
      return false;
    }
    if(confirmPassword.isEmpty){
      Get.snackbar('Confirmacion de contraseña vacía', 'Ingrese la confirmacion de contraseña');
      return false;
    }

    //Validar contraseña y confirmContraseña
    if(password != confirmPassword){
      Get.snackbar('Contraseñas no coinciden', 'Revise su contraseña');
      return false;
    }
    return true;
  }

  //Metodo para moverse entre Páginas
  void goToUserHomePage(){
    print('Viajando a pantalla User Home Page...');
  }
}
