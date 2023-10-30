import 'package:flutter/material.dart';
import 'package:gruporv2/models/remision.dart';
import 'package:gruporv2/screens/nuevo_prove.dart';
import 'package:gruporv2/screens/proveedores.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../models/usuarios.dart';
import '../services/remision_service.dart';
import '../services/usuario_service.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  List<Usuario> _usuarios = [];
  List<Remision> remisionList = [];
  final remisionService = RemisionService();

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAllRemisiones();
  }

  Map<String, List<Remision>> remisionesPorUsuario = {};

  Future<void> loadAllRemisiones() async {
    remisionesPorUsuario.clear();
    List<Remision> todasLasRemisiones =
        await remisionService.getTodasLasRemisiones();

    for (var remision in todasLasRemisiones) {
      var cc = remision.userCC.cc.toString();

      remisionesPorUsuario[cc] = remisionesPorUsuario[cc] ?? [];

      remisionesPorUsuario[cc]?.add(remision);
    }
    setState(() {
      // Forzar actualización de la interfaz de usuario
    });
  }

  Map<String, String> fechaUltimaRemision(String cc) {
    var remisiones = remisionesPorUsuario[cc];
    if (remisiones == null || remisiones.isEmpty) {
      return {'mes': 'Sin', 'dia': 'Registro'};
    }
    remisiones.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    var fecha = remisiones[0].createdAt;
    return {
      'mes': DateFormat('MMM', 'es').format(fecha),
      'dia': DateFormat('dd').format(fecha)
    };
  }

  Future<void> _loadUsuarios() async {
    try {
      final usuarios = await UsuarioService.getUsuarios();
      setState(() {
        // Filtrar la lista para excluir al usuario "Administrador General"
        _usuarios = usuarios
            .where((usuario) => usuario.name != "Administrador General")
            .toList();
      });
    } catch (e) {
      // manejar excepción
      //print(e);
    }
  }

  Future<void> _navigateToNuevoProve() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nuevoProve()),
    );

    if (result == true) {
      _loadUsuarios();
      loadAllRemisiones();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                  'assets/user.png'), // ruta de la imagen de perfil local
              radius: 35, // radio del círculo de la imagen
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/user.png'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            const Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grupo',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  'Empresarial R.',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text('Administrador',
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
      body: Column(
        children: <Widget>[
          const Column(
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Lista de proveedores',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          'Ultimo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            height: 1.0, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Registro',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            // height: 1.5, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          'PROVEEDOR',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            height: 1.5, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          'N° CONSECUTIVOS',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            height: 1.5, //bajar texto
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _loadUsuarios();
                await loadAllRemisiones();
              },
              child: ListView.builder(
                itemCount: _usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = _usuarios[index];
                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => proveedor_screen(
                            cc: usuario.cc,
                            usuario: usuario.name,
                          ),
                        ),
                      );
                      _loadUsuarios();
                      loadAllRemisiones();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3.0,
                        horizontal: 6.0,
                      ),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 226, 226),
                          border: Border.all(
                            color: const Color.fromARGB(255, 196, 196, 196),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fechaUltimaRemision(
                                            usuario.cc.toString())['mes'] ??
                                        'Sin',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      fontWeight: fechaUltimaRemision(usuario.cc
                                                  .toString())['mes'] ==
                                              null
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    fechaUltimaRemision(
                                            usuario.cc.toString())['dia'] ??
                                        'Registro',
                                    style: TextStyle(
                                      fontSize: fechaUltimaRemision(usuario.cc
                                                  .toString())['dia'] ==
                                              null
                                          ? 16
                                          : 15,
                                      color: Colors.black,
                                      fontWeight: fechaUltimaRemision(usuario.cc
                                                  .toString())['dia'] ==
                                              null
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usuario.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'NIT: ${usuario.cc}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      height: 0.9,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  remisionesPorUsuario[usuario.cc.toString()]
                                          ?.length
                                          .toString() ??
                                      '0',
                                  style: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton.icon(
            onPressed: _navigateToNuevoProve,
            icon: const Icon(Icons.add),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(370, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            label: const Text(
              'Crear proveedor',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
