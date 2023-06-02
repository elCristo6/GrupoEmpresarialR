import 'package:flutter/material.dart';
import '../models/usuarios.dart';
import '../services/usuario_service.dart';
//import 'package:grupo_empresarial_r/screens/nuevaSiderur.dart';
import 'package:grupo_empresarial_r/screens/nuevoProve.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  List<Usuario> _usuarios = [];

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    try {
      final usuarios = await UsuarioService.getUsuarios();
      setState(() {
        _usuarios = usuarios;
      });
    } catch (e) {
      // manejar excepción
      print(e);
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
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
        body: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: const [
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
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: const [
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
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: const [
                      Text(
                        'EMPRESA',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: const [
                      Text(
                        'N° De CONSECUTIVOS',
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
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _usuarios.length,
            itemBuilder: (context, index) {
              final usuario = _usuarios[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: Container(
                  height: 60,
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
                          children: const [
                            Text(
                              //usuario.createdAt.substring(5, 7),
                              'Enero',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                height: 1.5, //bajar texto
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              //usuario.createdAt.substring(8),
                              '10',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                //height: 1.7, //bajar texto
                                fontWeight: FontWeight.bold,
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
                                fontSize: 22,
                                color: Colors.black,
                                height: 1.7, //bajar texto
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'NIT: ${usuario.cc}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                height: 0.9, //bajar texto
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            // usuario.cc.toString(),
                            '15',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              //height: 1.5, //bajar texto
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // builder: (context) => const crearRemision()),
                      builder: (context) => nuevoProve()),
                );
              },
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
                  //height: 1.5, //bajar texto
                  //fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          /*TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const nuevaSiderur()),
                  //builder: (context) => const nuevoProve()),
                );
              },
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
                'Crear empresa',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  //height: 1.5, //bajar texto
                  //fontWeight: FontWeight.bold,
                ),
              )),*/
        ]));
  }
}
