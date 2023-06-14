import 'dart:convert';

import '../models/remision.dart';
import 'api.dart';

class RemisionService {
  static const String _endpoint = 'newRemission/';

  Future<Remision> crearRemision(Remision remision) async {
    try {
      final response = await API.post(_endpoint, remision.toJson());

      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return Remision.fromJson(jsonData);
      } else {
        throw Exception('Error al crear la remisión');
      }
    } catch (e) {
      throw Exception('Error de conexión o de la API');
    }
  }

  Future<Remision> obtenerRemision(int id) async {
    try {
      final response = await API.get('$_endpoint$id/');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Remision.fromJson(jsonData);
      } else {
        throw Exception('Error al obtener la remisión');
      }
    } catch (e) {
      throw Exception('Error de conexión o de la API');
    }
  }

  Future<List<Remision>> obtenerRemisiones() async {
    try {
      final response = await API.get(_endpoint);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        return jsonData.map((json) => Remision.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener las remisiones');
      }
    } catch (e) {
      throw Exception('Error de conexión o de la API');
    }
  }

  Future<void> eliminarRemision(int id) async {
    try {
      final response = await API.delete('$_endpoint$id/');

      if (response.statusCode != 204) {
        throw Exception('Error al eliminar la remisión');
      }
    } catch (e) {
      throw Exception('Error de conexión o de la API');
    }
  }
}
