// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class crearRemision extends StatelessWidget {
  const crearRemision({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';

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
                children: const [
                  Text(
                    'Christian Gonzalez',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text('Identificación: 123456789',
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
            Row(
              children: [
                Column(
                  children: const [
                    Center(
                      child: Text(
                        '    Consecutivo NO:',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          height: 1.5, //bajar texto
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20), // espacios en blanco
                Column(
                  children: const [
                    Center(
                      child: Text(
                        '872536',
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),

                Column(
                  children: [
                    Center(
                        child: Text(
                      'F $formattedDate',
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5, //bajar Texto
                      ),
                    ))
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 2),
              child: const Divider(
                color: Colors.grey,
                thickness: 3.0,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: const [
                    Text(
                      '   EMPRESA',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '   CIUDAD',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '   TRANSPORTADOR',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Cedula de ciudadania',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Direccion',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Placa del Vehiculo',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.5, //bajar texto
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: const Divider(
                    color: Colors.green,
                    thickness: 33.0,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
