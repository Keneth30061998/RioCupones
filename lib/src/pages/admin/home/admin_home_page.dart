import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rio_cupones/src/pages/admin/home/admin_home_controller.dart';

import '../../../constants/colors.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomeController con = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Barra de búsqueda mejorada
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            // Lista mejorada
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.white60,
                        child: Image.asset(
                          'assets/img/logo_cupones.png',
                        )),
                    title: Text('Negocio ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Descripción del negocio $index'),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    onTap: () {},
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      // FAB mejorado
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => con.goToAdminRegisterBusiness(),
        label: const Text('Agregar Negocio'),
        icon: const Icon(Icons.add),
        backgroundColor: primary_color,
        elevation: 6,
      ),
    );
  }
}
