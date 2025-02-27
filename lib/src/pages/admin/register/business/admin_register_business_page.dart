import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/constants/colors.dart';
import 'package:rio_cupones/src/pages/admin/register/business/admin_register_business_controller.dart';

class AdminRegisterBusinessPage extends StatelessWidget {
  AdminRegisterBusinessController con =
      Get.put(AdminRegisterBusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Registrar Negocio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Campo Nombre
            TextField(
              controller: con.nameController,
              decoration: InputDecoration(
                labelText: 'Nombre del Negocio',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Campo Dirección
            TextField(
              controller: con.addressController,
              decoration: InputDecoration(
                labelText: 'Dirección',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Botón para subir imagen
            GestureDetector(
              onTap: () {
                // Aquí llamas tu función para seleccionar la imagen
                print('Selecionar una imagen');
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: const Center(
                  child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Botón Guardar
            ElevatedButton(
              onPressed: () => con.registrar(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary_color,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Guardar Negocio',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
