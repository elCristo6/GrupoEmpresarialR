// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_constructors

import 'package:collection/collection.dart'; // Importa la librería collection
import 'package:flutter/material.dart';
import 'package:gruporv3/screens/prove_admin.dart'; // Importa la nueva pantalla
import 'package:gruporv3/services/remision_service.dart';
import 'package:gruporv3/services/usuario_service.dart';
import 'package:intl/intl.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<adminScreen> {
  final remisionService = RemisionService();
  int totalRemisiones = 0;
  int totalUsuarios = 0;
  bool _lanzarAlerta = false;
  DateTime ultimaFechaRemision =
      DateTime(2000); // Fecha muy antigua como valor inicial
  String creadorUltimaRemision = 'Desconocido';

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    final remisiones = await remisionService.getTodasLasRemisiones();
    final usuarios = await UsuarioService.getUsuarios();

    // Buscar la última fecha de remisión y su creador
    for (var remision in remisiones) {
      if (remision.createdAt.isAfter(ultimaFechaRemision)) {
        ultimaFechaRemision = remision.createdAt;
        int ccCreador = int.tryParse(remision.userCC.cc) ??
            -1; // Convierte a int y maneja posibles valores nulos

        var usuarioCreador = usuarios.firstWhereOrNull(
          (usuario) => usuario.cc == ccCreador,
        );

        if (usuarioCreador != null) {
          creadorUltimaRemision = usuarioCreador.name;
        }
      }
    }

    setState(() {
      totalRemisiones = remisiones.length;
      totalUsuarios = usuarios.length;
    });
  }

  Widget _buildUltimaRemisionInfoBox() {
    return _buildInfoBox(
      title: 'Última Remisión Creada',
      value:
          '${DateFormat('dd/MM/yyyy').format(ultimaFechaRemision)} por $creadorUltimaRemision',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user.png'), // ruta de la imagen de perfil local
              radius: 35, // radio del círculo de la imagen
            ),
            SizedBox(width: 60),
            Column(
              children: [
                Text(
                  'Tester',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  'Principal',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text('Administrador General',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(6.0), // Altura del borde inferior
          child: Container(
            width: double.infinity, // Anchura del borde inferior
            height: 9.0,
            color: Colors.grey, // Color del borde inferior
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Lanzar mensaje de cobro",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                value: _lanzarAlerta,
                onChanged: (value) {
                  setState(() {
                    _lanzarAlerta = value;
                  });
                },
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UsuarioScreen()),
                );
              },
              child: _buildInfoBox(
                title: 'Total Remisiones',
                value: totalRemisiones.toString(),
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoBox(
              title: 'Total Clientes',
              value: totalUsuarios.toString(),
            ),
            const SizedBox(height: 20),
            _buildUltimaRemisionInfoBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 226, 226),
        border: Border.all(
          color: const Color.fromARGB(255, 196, 196, 196),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
