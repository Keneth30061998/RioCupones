import 'package:flutter/material.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vendedores')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID Vendedor')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Estado')),
            DataColumn(label: Text('Fecha Creación')),
            DataColumn(label: Text('Fecha Caducidad')),
            DataColumn(label: Text('Acciones')),
          ],
          rows: [
            DataRow(cells: [
              _buildCell('1'),
              _buildCell('Juan Pérez'),
              _buildCell('juan@email.com'),
              _buildCell('Activo'),
              _buildCell('2024-01-10'),
              _buildCell('2025-01-10'),
              DataCell(Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _showEditModal(context, 'Juan Pérez'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              )),
            ])
          ],
        ),
      ),
    );
  }

  DataCell _buildCell(String text) {
    return DataCell(GestureDetector(
      onTap: () => _showEditModal(context, text),
      child: Text(text),
    ));
  }

  void _showEditModal(BuildContext context, String name) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Editar: $name', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(decoration: const InputDecoration(labelText: 'Nombre')),
              TextFormField(decoration: const InputDecoration(labelText: 'Email')),
              TextFormField(decoration: const InputDecoration(labelText: 'Estado')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Guardar Cambios'),
              ),
            ],
          ),
        );
      },
    );
  }
}
