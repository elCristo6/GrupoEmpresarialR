// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class nueva_siderur extends StatelessWidget {
  const nueva_siderur({super.key});

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
                    'NUEVO EMPRESA',
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
                    'Empresa',
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //controller: _textFieldController1,
                        decoration: InputDecoration(
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
                    'NIT',
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //controller: _textFieldController1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero de NIT',
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
                    // Accion para el boton
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(250, 40)),
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
