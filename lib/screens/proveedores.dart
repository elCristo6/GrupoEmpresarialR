import 'package:flutter/material.dart';

import '../models/usuarios.dart';
import '../screens/nueva_remision.dart';
import '../services/usuario_service.dart';

// ignore: camel_case_types
class proveedor_screen extends StatefulWidget {
  final int cc;
  final String usuario;
  const proveedor_screen({super.key, required this.cc, required this.usuario});
  //const proveedor_screen({Key? key}) : super(key: key);
  @override
  State<proveedor_screen> createState() => _proveedor_screenState();
}

// ignore: camel_case_types
class _proveedor_screenState extends State<proveedor_screen> {
  // ignore: unused_field
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
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int cc = widget.cc;
    final String usuario = widget.usuario;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
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
              const SizedBox(width: 20),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usuario,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Identificación: $cc',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
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
                      'Historial de remisiones',
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
                            'Fecha',
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
                        width: 60,
                      ),
                      Column(
                        children: [
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
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            'CONSECUTIVO',
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
                child: ListView.builder(
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final usuario = _usuarios[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 6.0),
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
                        const Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        //builder: (context) => const MiFormulario()),
                        builder: (context) => MiFormulario(
                              cc: cc,
                              usuario: usuario,
                            )),
                  );
                },
                icon: const Icon(Icons.add),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(370, 50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                label: const Text(
                  'Crear remision',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    //height: 1.5, //bajar texto
                    //fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
/*
// ignore: camel_case_types
class provedores extends StatelessWidget {
  final int cc;
  final String usuario;

  const provedores({super.key, required this.cc, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
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
              const SizedBox(width: 20),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usuario,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Identificación: $cc',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Historial de remisiones',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        'FECHA',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      Text(
                        'EMPRESA',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: [
                      Text(
                        'CONSECUTIVO',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onLongPressStart: (LongPressStartDetails details) {
                        final RenderBox box =
                            context.findRenderObject() as RenderBox;
                        final Offset localPosition =
                            box.globalToLocal(details.globalPosition);

                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            localPosition.dx,
                            localPosition.dy,
                            localPosition.dx + 1,
                            localPosition.dy + 1,
                          ),
                          items: <PopupMenuEntry>[
                            const PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.print),
                                  SizedBox(width: 10),
                                  Text('IMPRESION')
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.qr_code_2),
                                  SizedBox(width: 10),
                                  Text('GENERAR QR')
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 226, 226),
                          border: Border.all(
                            color: const Color.fromARGB(255, 196, 196, 196),
                            width: 1.0,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Enero',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        height: 1.5, //bajar texto
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black,
                                        height: 1, //bajar texto
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 70),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'DIACO S.A',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        height: 1.7, //bajar texto
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'NIT: 123456789-6',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        height: 0.9, //bajar texto
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 40),
                            Text(
                              '01258',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                //height: 1.5, //bajar texto
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 400,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MiFormulario(),
                          /*builder: (context) => crear_remision(
                                cc: cc,
                                usuario: usuario,
                              )),*/
                        ));
                  },
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(370, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  label: const Text(
                    'Crear remision',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      //height: 1.5, //bajar texto
                      //fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ));
  }
}
*/