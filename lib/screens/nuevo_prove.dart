import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gruporv2/models/usuarios.dart';

import '../services/usuario_service.dart';
//import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class nuevoProve extends StatelessWidget {
  nuevoProve({super.key});
  final _newUserInput = TextEditingController();
  final _ccInput = TextEditingController();
  final userNewMessage =
      const SnackBar(content: Text('Usuario creado correctamente'));

  final camposVacios =
      const SnackBar(content: Text('Debes Ingresar Usuario y Constraseña')
          //duration: Duration(seconds: 5),
          );

  void crearNuevoUsuario() {
    Usuario usuario = Usuario(
        cc: int.parse(_ccInput.text),
        name: _newUserInput.text,
        pass: _ccInput.text,
        userType: "proveedor",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    UsuarioService.crearUsuario(usuario).then((nuevoUsuario) {
      // Procesar el nuevo usuario creado
      // (por ejemplo, mostrar una notificación, navegar a otra pantalla, etc.)
      // print('Nuevo usuario creado: $nuevoUsuario');
    }).catchError((error) {
      // Manejar el error al crear el usuario
      //print('Error al crear el usuario: $error');
    });
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'NUEVO PROVEEDOR',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'PROVEEDOR',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                    ),
                  ),
                ],
              ),
              Container(
                width: 380,
                margin:
                    const EdgeInsets.all(3), //margen por derecha y por arriba
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextField(
                        controller: _newUserInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre Completo',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 80.0), // Define el ancho deseado aquí
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'CEDULA',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.7, //bajar texto
                    ),
                  ),
                ],
              ),
              Container(
                width: 380,
                margin:
                    const EdgeInsets.all(3), //margen por derecha y por arriba
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _ccInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero de cedula',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 80.0), // Define el ancho deseado aquí
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                alignment: Alignment.topRight,
                width: 300,
                child: TextButton(
                  onPressed: () {
                    if (_newUserInput.text.isEmpty || _ccInput.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(camposVacios);
                    } else {
                      crearNuevoUsuario();
                      _ccInput.clear();
                      _newUserInput.clear();

                      ScaffoldMessenger.of(context)
                          .showSnackBar(userNewMessage);
                      Navigator.pop(context, true);
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(250, 40)),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Guardar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
