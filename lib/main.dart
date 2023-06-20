import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:grupo_empresarial_r/screens/ejemploProveedores.dart';
//import 'package:flutter/services.dart';
import 'package:grupo_empresarial_r/screens/prove_admin.dart';
import 'package:grupo_empresarial_r/screens/proveedores.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../services/usuario_service.dart';

void main() {
  initializeDateFormatting('es');
  runApp(MyApp());
  //runApp(proveedor_screen());
  /*runApp(ChangeNotifierProvider(
   create: (context) => ItemsProvider(),
    child: const MaterialApp(
      home: proveedor_screen(),
    ),
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter  Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userInput = TextEditingController();
  final _passInput = TextEditingController();

  @override
  void dispose() {
    _userInput.dispose();
    _passInput.dispose();
    super.dispose();
  }

  final passError = const SnackBar(content: Text('Contraseña Incorrecta'));
  final camposVacios = const SnackBar(
      content: Text('Tienes que ingresar usuario y contraseña '));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350.0,
              height: 350.0,
              child: Image.asset('assets/logoInicio.png'),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  'GRUPO',
                  style: TextStyle(
                    fontSize: 33.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  'EMPRESARIAL R',
                  style: TextStyle(
                    fontSize: 33.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _userInput,
                decoration: const InputDecoration(
                    fillColor: Colors.green,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'USUARIO',
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 34,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _passInput,
                decoration: const InputDecoration(
                    fillColor: Colors.green,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'CONTRASEÑA',
                    //alignLabelWithHint: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    prefixIcon: Icon(
                      Icons.lock_person_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextButton(
                  onPressed: () {
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  example()),
                  );*/
                    if (_userInput.text.isEmpty || _userInput.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(camposVacios);
                      /*Fluttertoast.showToast(
                      msg: 'Tienes que ingresar Usuario y Contraseña',
                    );*/
                    } else {
                      UsuarioService.validarDatos(
                              int.parse(_userInput.text), _passInput.text)
                          .then((mensaje) {
                        if (mensaje.userType == "admin") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UsuarioScreen()),
                          );
                        } else if (mensaje.userType == "proveedor") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => proveedor_screen(
                                    //builder: (context) => provedores(
                                    cc: mensaje.cc ?? 0,
                                    usuario: mensaje.name ?? ''),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(passError);
                          /*Fluttertoast.showToast(
                          msg: mensaje.mensaje ?? '',
                        );*/
                        }
                        _passInput.clear();
                        _userInput.clear();
                      });
                    }
                  },
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
                  child: const Text('INGRESAR')),
            ),
          ],
        ),
      ),
    ));
  }
}
