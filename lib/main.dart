import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grupo_empresarial_r/providers/items_provider.dart';
import 'package:grupo_empresarial_r/screens/home_screen.dart';
import 'package:grupo_empresarial_r/screens/proveAdmin.dart';
import 'package:grupo_empresarial_r/screens/proveedores.dart';
import 'package:grupo_empresarial_r/screens/addItemsExample.dart';
import '../services/usuario_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (context) => ItemsProvider(),
    child: MaterialApp(
      home: MiFormulario(),
    ),
  ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350.0,
              height: 350.0,
              child: Image.asset('assets/logoInicio.png'),
            ),
            const SizedBox(
                child: Text(
              'GRUPO EMPRESARIAL R',
              style: TextStyle(
                fontSize: 33.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            )),
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
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 100),
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
            TextButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  example()),
                  );*/
                  if (_userInput.text.isEmpty || _userInput.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Tienes que ingresar Usuario y Contraseña',
                    );
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
                              builder: (context) => provedores(
                                  cc: mensaje.cc ?? 0,
                                  usuario: mensaje.name ?? ''),
                            ));
                      } else {
                        Fluttertoast.showToast(
                          msg: mensaje.mensaje ?? '',
                        );
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
                child: const Text('INGRESAR'))
          ],
        ),
      ),
    );
  }
}
