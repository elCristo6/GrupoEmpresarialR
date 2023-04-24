import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static const String _baseUrl =
      'http://grupoempresarialr-env-1.eba-sz7mczgn.us-east-1.elasticbeanstalk.com/';

  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse(_baseUrl + endpoint);
    final response = await http.get(url);
    return response;
  }

  static Future<http.Response> post(
      String endpoint, Map<String, dynamic> data) async {
    // Define una función estática llamada "post" que toma dos parámetros: "endpoint" y "data"
    final url = Uri.parse(_baseUrl +
        endpoint); // Crea un objeto Uri con la dirección base "_baseUrl" y el "endpoint" especificado
    final response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // Realiza una solicitud POST a la URL "url", utilizando los datos proporcionados en "data"
    // y un encabezado "Content-Type" que indica que el contenido es JSON
    return response;
    // Devuelve la respuesta completa de la solicitud POST
  }

  static Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse(_baseUrl + endpoint);
    final response = await http.delete(url);
    return response;
  }
}
