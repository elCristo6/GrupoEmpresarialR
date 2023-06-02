import 'dart:convert';
import '../models/usuarios.dart';
import 'api.dart';

class UsuarioService {
  static const String _endpoint = 'users/';

// Obtiene todos los usuarios de la API.
  /// **Retorna:**
  ///   * Una lista de usuarios.
  ///   * `Exception` si ocurre un error.
  static Future<List<Usuario>> getUsuarios() async {
    // Realiza una solicitud GET a la API.
    final response = await API.get(_endpoint);

    // Si la solicitud tuvo éxito, decodifica la respuesta JSON y crea una lista de usuarios.
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      return jsonData.map((json) => Usuario.fromJson(json)).toList();
    } else {
      // Lanza una excepción si la solicitud falló.
      throw Exception('Error al obtener los usuarios');
    }
  }

  /// Crea un nuevo usuario en la API.
  /// * `usuario`: El usuario a crear.
  /// **Retorna:**
  ///   * El usuario creado.
  ///   * `Exception` si ocurre un error.
  static Future<Usuario> crearUsuario(Usuario usuario) async {
    // Realiza una solicitud POST a la API.
    final response = await API.post(_endpoint, usuario.toJson());
    // Si la solicitud tuvo éxito, decodifica la respuesta JSON y crea un nuevo usuario.
    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      print('Nuevo usuario creado:ss');
      return Usuario.fromJson(jsonData);
    } else {
      // Lanza una excepción si la solicitud falló.
      throw Exception('Error al crear el usuario');
    }
  }

  static Future<void> eliminarUsuario(String cc) async {
    final response = await API.delete('$_endpoint$cc/');
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar el usuario');
    }
  }

  static Future<ValidacionResultado> validarDatos(int cc, String pass) async {
    final response = await API.get('$_endpoint$cc/');
    if (response.statusCode == 200) {
      // La solicitud fue exitosa, aquí puedes manejar los datos de la respuesta
      final jsonData = jsonDecode(response.body);
      if (jsonData['cc'] == cc && jsonData['pass'] == pass) {
        // return '${jsonData['userType']}';
        final userType = jsonData['userType'];
        final name = jsonData['name'];
        final cc = jsonData['cc'];
        return ValidacionResultado(
          mensaje: 'Validación exitosa',
          userType: userType,
          name: name,
          cc: cc,
        );
        //print(response.body);
      } else {
        //print('El usuario o contraseña es incorrecto');
        return ValidacionResultado(
          mensaje: 'El usuario o contraseña es incorrecto',
        );
      }
    } else {
      // La solicitud falló, aquí puedes manejar el error
      //print(          'La solicitud falló con el código de estado: ${response.statusCode}.');
      return ValidacionResultado(
        mensaje: 'El usuario o contraseña es incorrecto',
      );
    }
  }
}

class ValidacionResultado {
  final String? mensaje;
  final String? userType;
  final int? cc;
  final String? name;

  ValidacionResultado({
    this.mensaje,
    this.userType,
    this.cc,
    this.name,
  });
}
