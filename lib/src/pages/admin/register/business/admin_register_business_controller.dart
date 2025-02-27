import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/models/Business.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../../providers/business_provider.dart';

class AdminRegisterBusinessController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  BusinessProvider businessProvider = BusinessProvider();

  //Metodo para registrar un negocio
  void registrar(BuildContext context) async {
    String name = nameController.text;
    String address = addressController.text;

    if (isValidForm(name, address)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 70, msg: "Registro de Negocio");
      Business business = Business(name: name, address: address);
      Response response = await businessProvider.create(business);
      print('Response: ${response.body}');

      //Get.snackbar('Datos Válidos', 'Registro de usuario...');
      print('Nombre: ${name}');
      print('Direccion: ${address}');

      progressDialog.close();
    }
  }

  //Metodos para validar los campos del formulario
  bool isValidForm(
    String name,
    String address,
  ) {
    //ver que los campos no esten vacios
    if (name.isEmpty && address.isEmpty) {
      Get.snackbar('Campos vacios', 'Ingrese informacion en los campos vacios');
      return false;
    }
    return true;
  }
}
