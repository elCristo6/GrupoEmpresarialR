import 'package:flutter/material.dart';
//import 'package:grupo_empresarial_r/screens/crearRemision.dart';
//import 'package:grupo_empresarial_r/screens/proveedores.dart';
import 'package:grupo_empresarial_r/screens/empresas.dart';
import '../models/usuarios.dart';
import '../services/usuario_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter  Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userInput = TextEditingController();
  final _dato2Controller = TextEditingController();
  @override
  void dispose() {
    _userInput.dispose();
    _dato2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    /* return Scaffold(
      // appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //  title: Text(widget.title),
      //  ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        // builder: (context) => const crearRemision()),
                        builder: (context) => const empresas()),
                  );
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
    ); */
    // Crea una estructura de datos para la interfaz de usuario
    return Scaffold(
      // Crea una barra de herramientas en la parte superior de la pantalla
      appBar: AppBar(
        // Establece el título de la barra de herramientas
        title: const Text('Lista de Usuarios'),
      ),
      // Crea el cuerpo de la interfaz de usuario
      body: FutureBuilder<List<Usuario>>(
        // Obtiene los datos de los usuarios del servicio de usuarios
        future: UsuarioService.getUsuarios(),
        // Crea una interfaz de usuario que muestra los usuarios
        builder: (context, snapshot) {
          // Comprueba si la solicitud de datos está completa
          if (snapshot.connectionState == ConnectionState.done) {
            // Comprueba si hay datos disponibles
            if (snapshot.hasData) {
              // Obtiene los datos de los usuarios
              final usuarios = snapshot.data!;
              // Crea una lista de vistas de los usuarios
              return ListView.builder(
                // Establece el número de elementos en la lista
                itemCount: usuarios.length,
                // Crea una vista de lista para cada usuario
                itemBuilder: (context, index) {
                  // Obtiene el usuario actual
                  final usuario = usuarios[index];
                  // Crea una lista de elementos para el usuario
                  return ListTile(
                    // Establece el título de la lista de elementos
                    title: Text(usuario.name),
                    // Establece el subtítulo de la lista de elementos
                    subtitle: Column(
                      // Alinea los elementos del subtítulo a la izquierda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Agrega los elementos del subtítulo a la lista
                      children: [
                        // Muestra el número de cédula del usuario
                        Text('CC: ${usuario.cc}'),
                        // Muestra el tipo de usuario del usuario
                        Text('Tipo de usuario: ${usuario.userType}'),
                        // Muestra la fecha de creación del usuario
                        Text('Fecha de creación: ${usuario.createdAt}'),
                        // Muestra la fecha de actualización del usuario
                        Text('Fecha de actualización: ${usuario.updatedAt}'),
                      ],
                    ),
                    // Agrega un icono de flecha a la derecha de la lista de elementos
                    trailing: const Icon(Icons.arrow_forward_ios),
                    // Define una función para navegar a la pantalla de detalles del usuario
                    onTap: () {
                      // Navega a la pantalla de detalles del usuario
                    },
                  );
                },
              );
            } else {
              // No hay usuarios disponibles
              return const Center(
                child: Text('No hay usuarios disponibles'),
              );
            }
          } else {
            // La solicitud de datos aún está en curso
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
